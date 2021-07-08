import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/core/base/PageStatus.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/utils/WebUtils.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;

  WebPage(this.title, this.url);

  @override
  State<StatefulWidget> createState() => _WebPage();
}

class _WebPage extends CoreState<WebPage> {
  bool _showLoad = true;
  bool _showError = false;
  String _tip = "加载中";
  List<WebResourceErrorType> _errorTypes = [WebResourceErrorType.badUrl, WebResourceErrorType.fileNotFound];

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(widget.title);

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

  @override
  void init() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
}
