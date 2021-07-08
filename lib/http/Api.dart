class Api {
  /// 登录
  static const Login = "user/login";

  /// 注册
  static const Register = "user/register";

  /// 注销
  static const LoginOut = "user/logout/json";

  /// 轮播图
  static const Banner = "banner/json";

  /// 公众号分类
  static const ChapterTree = "wxarticle/chapters/json";

  /// 置顶文章
  static const TopArticle = "article/top/json";

  /// 首页文章
  static String getArticles(int page) => "article/list/$page/json";

  /// 搜索热词
  static const HotKey = "hotkey/json";

  /// 文章搜索
  static String searchArticle(int page) => "article/query/$page/json";

  /// 公众号文章
  static String getChapterArticles(int id, int page) => "wxarticle/list/$id/$page/json";

  /// 项目分类
  static const ProjectTree = "project/tree/json";

  /// 项目文章列表
  static String getProjectArticles(int id, int page) => "project/list/$page/json?cid=$id";

  /// 体系分类
  static const SystemTree = "tree/json";

  /// 导航分类
  // ignore: non_constant_identifier_names
  static String NaviTree = "navi/json";

  /// 体系文章列表
  static String getSystemArticles(int id, int page) => "article/list/$page/json?cid=$id";

  /// 用户积分信息
  static const UserCoin = "lg/coin/userinfo/json";

  /// 用户收藏列表
  static String getUserCollections(int page) => "lg/collect/list/$page/json";

  /// 收藏站内文章
  static String getCollectArticle(int id) => "lg/collect/$id/json";

  /// 在收藏列表中取消收藏
  static String unCollectArticleInList(int id) => "lg/uncollect/$id/json";

  /// 在文章页面取消收藏
  static String unCollectArticleInDetail(int id) => "lg/uncollect_originId/$id/json";

  /// 收藏站外文章
  static const CollectOutsideArticle = "lg/collect/add/json";

  /// 获取积分列表
  static String getCoinList(int page) => "lg/coin/list/$page/json";

  /// 获取积分排行榜
  static String getRankList(int page) => "coin/rank/$page/json";

  /// 获取TODO列表
  static String getTodoList(int page) => "lg/todo/v2/list/$page/json";

  /// 新增TODO
  static const TodoAdd = "lg/todo/add/json";

  /// 删除TODO
  static String getTodoDelete(int id) => "lg/todo/delete/$id/json";

  /// 修改TODO内容
  static String getTodoUpdate(int id) => "lg/todo/update/$id/json";

  /// 修改TODO状态
  static String getTodoStatus(int id) => "lg/todo/done/$id/json";

  /// 收藏网址列表
  static const CollectWebsiteList = "lg/collect/usertools/json";

  /// 新增网址收藏
  static const CollectWebsiteAdd = "lg/collect/addtool/json";

  /// 更新网址收藏
  static const CollectWebsiteUpdate = "lg/collect/updatetool/json";

  /// 删除网址收藏
  static const CollectWebsiteDelete = "lg/collect/deletetool/json";

  /// 获取我的分享列表
  static String getShareList(int page) => "user/lg/private_articles/$page/json";

  /// 新增我的分享
  static const ShareListAdd = "lg/user_article/add/json";

  /// 删除我的分享
  static String getShareDelete(int id) => "lg/user_article/delete/$id/json";

  /// 广场分享列表
  static String getSquareList(int page) => "user_article/list/$page/json";

  /// 用户的广场分享列表
  static String getSquareUserList(int userId, int page) => "user/$userId/share_articles/$page/json";
}
