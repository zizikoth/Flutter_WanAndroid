import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/core/base/PageStatus.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/UserManager.dart';
import 'package:wan/tools/utils/WebUtils.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;
  final int? id;

  WebPage(this.title, this.url, {this.id});

  @override
  State<StatefulWidget> createState() => _WebPage();
}

class _WebPage extends CoreState<WebPage> {
  ApiService _api = ApiService();
  bool _showLoad = true;
  bool _showError = false;
  bool _isCollected = false;
  String _tip = "加载中";
  List<WebResourceErrorType> _errorTypes = [WebResourceErrorType.badUrl, WebResourceErrorType.fileNotFound];

  @override
  PreferredSizeWidget? buildAppBar() {
    return TitleBar(widget.title, actions: [
      if (widget.id != null)
        IconButton(
            onPressed: () {
              _collectOrUnCollectArticle();
            },
            icon: _isCollected ? Icon(Icons.favorite, color: ResColors.Red) : Icon(Icons.favorite_border, color: ResColors.TextNormal))
    ]);
  }

  @override
  Widget buildBody() {
    return Stack(
      children: [
        WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          navigationDelegate: (NavigationRequest request) {
            var shouldBlock = WebUtils.shouldBlockUrl(request.url);
            Logger.logTag("WebPage", "shouldBlock = $shouldBlock url = ${request.url}");
            return shouldBlock ? NavigationDecision.prevent : NavigationDecision.navigate;
          },
          onWebResourceError: (error) {
            Logger.logTag("WebPage", error.errorType);
            if (error.errorType != null && _errorTypes.indexOf(error.errorType!) != -1) {
              setState(() => _showError = true);
            }
          },
          onProgress: (progress) {
            setState(() {
              _showLoad = progress != 100;
              _tip = "加载进度：$progress";
            });
          },
        ),
        if (_showLoad) LoadingState(_tip),
        if (_showError) WebErrorState()
      ],
    );
  }

  _collectOrUnCollectArticle() {
    var request = _isCollected ? _api.unCollectArticleInDetail(widget.id.orEmpty) : _api.collectArticle(widget.id.orEmpty);
    request.then((value) {
      if (value) {
        if (_isCollected) {
          UserManager.removeUserCollections(widget.id.toString());
          EventManager.fireCollect();
        } else {
          UserManager.addUserCollections(widget.id.toString());
          EventManager.fireCollect();
        }
        setState(() => _isCollected = !_isCollected);
      }
    });
  }

  @override
  void init() {
    var list = UserManager.getUserCollections();
    var id = widget.id.toString();
    Logger.logTag("Collection", "list = $list id = $id");
    _isCollected = list.contains(id);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
}
