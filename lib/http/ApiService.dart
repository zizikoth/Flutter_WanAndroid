import 'package:wan/core/base/CoreState.dart';
import 'package:wan/entity/local/Todo.dart';
import 'package:wan/entity/local/Zip.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/entity/remote/BannerResponse.dart';
import 'package:wan/entity/remote/ChaptersResponse.dart';
import 'package:wan/entity/remote/CoinListResponse.dart';
import 'package:wan/entity/remote/CoinResponse.dart';
import 'package:wan/entity/remote/HotKeyResponse.dart';
import 'package:wan/entity/remote/NaviResponse.dart';
import 'package:wan/entity/remote/ProjectResponse.dart';
import 'package:wan/entity/remote/RankResponse.dart';
import 'package:wan/entity/remote/ShareResponse.dart';
import 'package:wan/entity/remote/SystemResponse.dart';
import 'package:wan/entity/remote/TodoResponse.dart';
import 'package:wan/entity/remote/TopArticlesResponse.dart';
import 'package:wan/entity/remote/UserResponse.dart';
import 'package:wan/entity/remote/WebsiteResponse.dart';
import 'package:wan/http/Api.dart';
import 'package:wan/http/Http.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/UserManager.dart';
import 'package:wan/ui/other/login/LoginPage.dart';

class ApiService {
  var isFirst = true;

  /// 登录
  /// account 账号
  /// pwd     密码
  Future login(String account, String pwd) async {
    Map<String, dynamic> params = Map();
    params['username'] = account;
    params['password'] = pwd;
    return Http.post(Api.Login, null, false, params: params).then((value) {
      var data = UserResponse.fromJson(value).data;
      if (data != null) {
        /// 存储用户信息
        UserManager.setUserName(data.username.orEmpty);

        /// 发送登录通知
        EventManager.fireLogin();
      }
    });
  }

  /// 注册
  /// account 账号
  /// pwd     密码
  /// rePwd   校验密码
  Future register(String account, String pwd, String rePwd) async {
    Map<String, dynamic> params = Map();
    params['username'] = account;
    params['password'] = pwd;
    params['repassword'] = rePwd;
    return Http.post(Api.Register, null, false, params: params).then((value) {
      if (value != null) {
        /// 注册成功
        return login(account, pwd);
      }
    });
  }

  /// 退出登录
  Future loginOut() {
    return Http.get(Api.LoginOut, null, false, checkError: false).then((value) {
      /// 清除用户信息
      UserManager.loginOut();
      RouteManager.popAndPush(LoginPage());
    });
  }

  /// 获取首页数据
  Future<ZipData3<List<HomeBanner>, List<Chapter>, List<Article>>?> getHomeData(CoreState? state) {
    var bannerReq = Http.get(Api.Banner, state, isFirst);
    var chapterReq = Http.get(Api.ChapterTree, state, isFirst);
    var topArticleReq = Http.get(Api.TopArticle, state, isFirst);
    var articleReq = Http.get(Api.getArticles(0), state, isFirst);
    return Future.wait([bannerReq, chapterReq, topArticleReq, articleReq]).then((value) {
      var isSuccess = true;
      value.forEach((element) {
        if (element == null) isSuccess = false;
      });
      if (isSuccess) {
        var banner = BannerResponse.fromJson(value[0]).data.orEmpty;
        var chapters = ChaptersResponse.fromJson(value[1]).data.orEmpty;
        var topArticles = TopArticlesResponse.fromJson(value[2]);
        topArticles.data?.forEach((element) => element.isTop = true);
        var articles = ArticlesResponse.fromJson(value[3]);
        List<Article> data = [];
        data.addAll(topArticles.data.orEmpty);
        data.addAll(articles.data?.datas ?? []);
        isFirst = false;
        return ZipData3<List<HomeBanner>, List<Chapter>, List<Article>>(banner, chapters, data);
      }
    });
  }

  /// 获取文章列表
  /// page  页码
  Future<Articles?> getArticles(CoreState? state, int page) {
    return Http.get(Api.getArticles(page), state, isFirst).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data != null) {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取热门搜索词
  Future<List<String>> getHotKeys() {
    return Http.get(Api.HotKey, null, false).then((value) {
      var data = HotKeyResponse.fromJson(value);
      return data.data.orEmpty.map((e) => e.name.orEmpty).toList();
    });
  }

  /// 搜索文章
  /// keyWord   关键字
  Future<Articles?> searchArticle(CoreState? state, String keyWord, int page) {
    Map<String, dynamic> params = Map();
    params['k'] = keyWord;
    return Http.post(Api.searchArticle(page), state, isFirst, params: params).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取主题分类
  Future<List<Chapter>?> getChapterTree(CoreState? state) {
    return Http.get(Api.ChapterTree, state, isFirst).then((value) {
      var data = ChaptersResponse.fromJson(value).data;
      if (data.isNullOrEmpty) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取主题分类下的文章
  /// id    主题id
  /// page  页码
  Future<Articles?> getChapterArticles(CoreState? state, int id, int page) {
    return Http.get(Api.getChapterArticles(id, page), state, isFirst).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取项目分类
  Future<List<Project>?> getProjectTree(CoreState? state) {
    return Http.get(Api.ProjectTree, state, isFirst).then((value) {
      var data = ProjectResponse.fromJson(value).data;
      if (data.isNotNullOrEmpty) {
        isFirst = false;
        return data;
      } else {
        if (isFirst) state.showEmpty();
      }
    });
  }

  /// 获取项目分类下的文章
  /// id    项目分类id
  /// page  页码
  Future<Articles?> getProjectArticles(CoreState? state, int id, int page) {
    return Http.get(Api.getProjectArticles(id, page), state, isFirst).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取体系分类
  Future<List<System>?> getSystemTree(CoreState? state) {
    return Http.get(Api.SystemTree, state, isFirst).then((value) {
      var data = SystemResponse.fromJson(value).data;
      if (data.isNotNullOrEmpty) {
        isFirst = false;
        List<System> list = [];
        data?.forEach((element) {
          list.add(System(isTitle: true, name: element.name));
          list.addAll(element.children.orEmpty);
        });
        return list;
      } else {
        if (isFirst) state.showEmpty();
      }
    });
  }

  /// 获取体系分类文章
  /// id    体系分类id
  /// page  页码
  Future<Articles?> getSystemArticles(CoreState? state, int id, int page) {
    return Http.get(Api.getSystemArticles(id, page), state, isFirst).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取导航分类数据
  Future<List<System>?> getNaviTree(CoreState? state) {
    return Http.get(Api.NaviTree, state, isFirst).then((value) {
      var data = NaviResponse.fromJson(value).data;
      if (data.isNotNullOrEmpty) {
        isFirst = false;
        List<System> list = [];
        data?.forEach((element) {
          list.add(System(isTitle: true, name: element.name));
          list.addAll(element.articles.orEmpty.map((e) => System(name: e.title, link: e.link)).toList());
        });
        return list;
      } else {
        if (isFirst) state.showEmpty();
      }
    });
  }

  /// 获取我的积分数据
  Future<CoinInfo?> getMineCoinInfo() {
    return Http.get(Api.UserCoin, null, false, checkError: false).then((value) {
      var data = CoinResponse.fromJson(value).data;
      if (data != null) {
        return data;
      }
    });
  }

  /// 获取我的收藏数据
  Future<int> getMineCollections() {
    return Http.get(Api.getUserCollections(0), null, false, checkError: false).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data != null) {
        return data.total ?? 0;
      } else {
        return 0;
      }
    });
  }

  /// 获取我的收藏列表
  /// page  页码
  Future<Articles?> getCollections(CoreState? state, int page) {
    return Http.get(Api.getUserCollections(page), state, isFirst, checkError: false).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 收藏文章
  /// id  文章id
  Future<bool> collectArticle(int id) {
    return Http.post(Api.getCollectArticle(id), null, false).then((value) => value != null);
  }

  /// 收藏站外文章
  /// title   文章标题
  /// author  文章作者
  /// link    文章地址
  Future<bool> collectOutsideArticle(String title, String author, String link) {
    Map<String, String> params = Map();
    params['title'] = title;
    params['author'] = author;
    params['link'] = link;
    return Http.post(Api.CollectOutsideArticle, null, false, params: params).then((value) => value != null);
  }

  /// 收藏列表中取消收藏
  /// id        收藏列表中的id
  /// originId  文章本来的id
  Future<bool> unCollectArticleInList(int id, int originId) {
    Map<String, dynamic> params = Map();
    params['originId'] = originId;
    return Http.post(Api.unCollectArticleInList(id), null, false, params: params).then((value) => value != null);
  }

  /// 获取积分列表
  /// page  页码
  Future<CoinListInfo?> getCoinList(CoreState? state, int page) {
    return Http.get(Api.getCoinList(page), state, isFirst).then((value) {
      var data = CoinListResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取排名数据
  /// page  页码
  Future<RankListInfo?> getRankList(CoreState? state, int page) {
    return Http.get(Api.getRankList(page), state, isFirst).then((value) {
      var data = RankListResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 添加一个Todo
  /// title     标题
  /// content   内容
  /// type      类型
  /// priority  优先级
  Future<bool> addTodo(String title, String content, int type, int priority) {
    Map<String, dynamic> params = Map();
    params['title'] = title;
    params['content'] = content;
    params['date'] = TimeUtils.nowTime().YMD;
    params['type'] = type;
    params['priority'] = priority;
    return Http.post(Api.TodoAdd, null, false, params: params).then((value) => value != null);
  }

  /// 删除一个Todo
  /// id  清单id
  Future<bool> deleteTodo(int id) {
    return Http.post(Api.getTodoDelete(id), null, false).then((value) => value != null);
  }

  /// 更新Todo数据
  /// id        清单id
  /// title     标题
  /// content   内容
  /// type      类型
  /// priority  优先级
  Future<bool> updateTodoInfo(int id, String title, String content, int type, int priority) {
    Map<String, dynamic> params = Map();
    params['title'] = title;
    params['content'] = content;
    params['date'] = TimeUtils.nowTime().YMD;
    params['type'] = type;
    params['priority'] = priority;
    return Http.post(Api.getTodoUpdate(id), null, false, params: params).then((value) => value != null);
  }

  /// 更新Todo状态
  /// id      清单id
  /// finish  清单是否完成
  Future<bool> updateTodoStatus(int id, bool finish) {
    Map<String, dynamic> params = Map();
    params['status'] = finish ? '1' : '0';
    return Http.post(Api.getTodoStatus(id), null, false, params: params).then((value) => value != null);
  }

  /// 获取Todo列表
  /// page    页码
  /// filter  筛选条件
  Future<TodoListInfo?> getTodoList(CoreState? state, int page, TodoFilter filter) {
    Map<String, dynamic> params = Map();
    if (filter.status != TodoStatus.ALL) params['status'] = filter.status;
    if (filter.type != TodoType.ALL) params['type'] = filter.type;
    if (filter.priority != TodoPriority.ALL) params['priority'] = filter.priority;
    params['orderby'] = filter.orderBy;
    return Http.get(Api.getTodoList(page), state, isFirst, params: params).then((value) {
      var data = TodoResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取收藏网址列表
  Future<List<Website>?> getWebsiteList(CoreState? state) {
    return Http.get(Api.CollectWebsiteList, state, isFirst).then((value) {
      var data = WebsiteResponse.fromJson(value).data;
      if (data.isNullOrEmpty) {
        state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 更新网址收藏
  /// website 网址内容
  Future<bool> updateWebsite(Website website) {
    Map<String, dynamic> params = Map();
    params['id'] = website.id;
    params['name'] = website.name;
    params['link'] = website.link;
    return Http.post(Api.CollectWebsiteUpdate, null, false, params: params).then((value) => value != null);
  }

  /// 新增网址收藏
  /// name 标题
  /// link 链接
  Future<bool> addWebsite(String name, String link) {
    Map<String, dynamic> params = Map();
    params['name'] = name;
    params['link'] = link;
    return Http.post(Api.CollectWebsiteAdd, null, false, params: params).then((value) => value != null);
  }

  /// 删除网址收藏
  Future<bool> deleteWebsite(int id) {
    Map<String, dynamic> params = Map();
    params['id'] = id;
    return Http.post(Api.CollectWebsiteDelete, null, false, params: params).then((value) => value != null);
  }

  /// 获取我的分享列表
  Future<ShareInfo?> getShareList(CoreState? state, int page) {
    return Http.get(Api.getShareList(page), state, isFirst).then((value) {
      var data = ShareResponse.fromJson(value).data;
      var isDataEmpty = data == null || data.shareArticles == null || (data.shareArticles!.datas.isNullOrEmpty && data.coinInfo == null);
      if (isDataEmpty && isFirst) {
        state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 新增分享
  Future<bool> addShare(String title, String link) {
    Map<String, dynamic> params = Map();
    params['title'] = title;
    params['link'] = link;
    return Http.post(Api.ShareListAdd, null, false, params: params).then((value) => value != null);
  }

  /// 删除分享
  Future<bool> deleteShare(int id) {
    return Http.post(Api.getShareDelete(id), null, false).then((value) => value != null);
  }

  /// 获取广场分享文章列表
  Future<Articles?> getSquareList(CoreState? state, int page) {
    return Http.get(Api.getSquareList(page), state, isFirst).then((value) {
      var data = ArticlesResponse.fromJson(value).data;
      if (data == null || (data.datas.isNullOrEmpty && isFirst)) {
        if (isFirst) state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }

  /// 获取广场用户分享列表
  Future<ShareInfo?> getSquareUserList(CoreState? state, int userId, int page) {
    return Http.get(Api.getSquareUserList(userId, page), state, isFirst).then((value) {
      var data = ShareResponse.fromJson(value).data;
      var isDataEmpty = data == null || data.shareArticles == null || (data.shareArticles!.datas.isNullOrEmpty && data.coinInfo == null);
      if (isDataEmpty && isFirst) {
        state.showEmpty();
      } else {
        isFirst = false;
        return data;
      }
    });
  }
}
