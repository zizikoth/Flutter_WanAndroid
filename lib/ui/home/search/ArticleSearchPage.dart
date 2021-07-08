import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/core/base/Status.dart';
import 'package:wan/entity/local/WrapItemEntity.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/DataManager.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/item/ArticleItem.dart';
import 'package:wan/widget/item/SearchBar.dart';
import 'package:wan/widget/item/SystemItem.dart';

class ArticleSearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleSearchPage();
}

class _ArticleSearchPage extends BaseState<ArticleSearchPage> {
  bool _showWord = true;

  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 0;

  /// 数据源
  List<Article> _articles = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  List<WrapItemEntity> _histories = [];

  List<WrapItemEntity> _hotKeys = [];

  String _searchWord = "";

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "搜索",
        bottom: PreferredSize(
            preferredSize: Size(ResDimen.width, ResDimen.barHeight),
            child: SearchBar(
              content: _searchWord,
              onSearch: (text) {
                _onSearch(text);
              },
              onTextChanged: (text) {
                _searchWord = text;
                if (text.isEmpty) {
                  changeState(States.Content);
                  setState(() {
                    _showWord = true;
                  });
                }
              },
            )),
        onTitleTap: () {
          if (!_showWord && _scrollController.offset > Constant.limitOffset) {
            _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
          }
        },
      );

  @override
  Widget buildContent() {
    return WillPopScope(
      child: _showWord ? _buildHotKey() : _buildArticle(),
      onWillPop: () async {
        if (!_showWord) {
          setState(() {
            _showWord = true;
            _searchWord = "";
          });
        } else {
          RouteManager.pop();
        }
        return false;
      },
    );
  }

  Widget _buildHotKey() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(7.5.w),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Wrap(
              children: _histories
                  .map((e) => WrapItem(e, onTap: (item) {
                        if (item.isTitle != true) _onSearch(item.title);
                      }))
                  .toList()),
          Wrap(
              children: _hotKeys
                  .map((e) => WrapItem(e, onTap: (item) {
                        if (item.isTitle != true) _onSearch(item.title);
                      }))
                  .toList())
        ],
      )),
    );
  }

  Widget _buildArticle() {
    return SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(),
        onRefresh: () {
          _page = 0;
          start();
        },
        onLoading: () {
          start();
        },
        child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(_articles[index]),
          itemCount: _articles.length,
        ));
  }

  void _onSearch(String keyWord) {
    /// 历史记录
    DataManager.saveKeyWord(keyWord);

    /// 添加到当前记录
    var list = [];
    _histories.forEach((element) {
      if (element.isTitle != true) list.add(element.title);
    });
    var index = list.indexOf(keyWord);
    if (index == -1) {
      list.insert(0, keyWord);
    } else {
      list
        ..removeAt(index)
        ..insert(0, keyWord);
    }

    setState(() {
      _histories.clear();
      _histories.add(WrapItemEntity("历史记录", 0, true));
      _histories.addAll(list.map((e) => WrapItemEntity(e, 0, false)).toList());
      _page = 0;
      _searchWord = keyWord;
      _showWord = false;
    });
    changeState(States.Loading);
    start();
  }

  @override
  void initialize() {}

  @override
  void start() {
    if (_showWord) {
      changeState(States.Content);

      /// 历史记录
      var words = DataManager.getKeyWord();
      setState(() {
        _histories.clear();
        if (words.isNotNullOrEmpty) {
          _histories.add(WrapItemEntity("历史记录", 0, true));
          _histories.addAll(words.map((e) => WrapItemEntity(e, 0, false)).toList());
        }
      });

      /// 搜索热词
      _api.getHotKeys().then((value) {
        setState(() {
          _hotKeys.clear();
          if (value.isNotNullOrEmpty) {
            _hotKeys.add(WrapItemEntity("搜索热词", 0, true));
            _hotKeys.addAll(value.map((e) => WrapItemEntity(e, 0, false)).toList());
          }
        });
      });
    } else {
      _api.searchArticle(state, _searchWord, _page).then((articles) {
        setState(() {
          _refreshController.finish(hasMore: articles?.hasMore);
          if (articles != null && articles.datas.isNotNullOrEmpty) {
            if (_page == 0) {
              _articles = articles.datas.orEmpty;
            } else {
              _articles.addAll(articles.datas.orEmpty);
            }
            _page++;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
