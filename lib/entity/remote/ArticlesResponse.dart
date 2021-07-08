import 'package:wan/tools/ext/StringExt.dart';
import 'package:wan/tools/utils/CommUtils.dart';

/// data : {"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":197,"chapterName":"Native Crash","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18433,"link":"https://juejin.cn/post/6966169836703449119","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621959501000,"realSuperChapterId":53,"selfVisible":0,"shareDate":1621959449000,"shareUser":"鸿洋","superChapterId":76,"superChapterName":"热门专题","tags":[],"title":"ART虚拟机 | Android应用中SIGSEGV信号的处理流程","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":320,"chapterName":"内存管理","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18431,"link":"https://www.jianshu.com/p/cae73cc45346","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621959489000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1621959431000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"Android GC 简史","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":320,"chapterName":"内存管理","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18432,"link":"https://www.jianshu.com/p/6239672cf0d5","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621959480000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1621959443000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"针对「内存抖动」的一次测试","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18429,"link":"/blog/show/3010","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621958400000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1621959000000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2021-05-19 ~ 2021-05-26）","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18424,"link":"https://juejin.cn/post/6966079368820949029","niceDate":"19小时前","niceShareDate":"19小时前","origin":"","prefix":"","projectLink":"","publishTime":1621924114000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621924114000,"shareUser":"请叫我齐岛主","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"优化Glide加载超大gif图","type":0,"userId":94852,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18423,"link":"https://juejin.cn/post/6966057952961069069/","niceDate":"22小时前","niceShareDate":"22小时前","origin":"","prefix":"","projectLink":"","publishTime":1621912002000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621912002000,"shareUser":"xll","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"LeetCode刷题笔记710黑名单中的随机数------我终于弄懂了官方解题思路","type":0,"userId":22903,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18422,"link":"https://juejin.cn/post/6844904038513770510","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621906056000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621906056000,"shareUser":"躬行之","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"设计模式之外观设计模式","type":0,"userId":23270,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":185,"chapterName":"组件化","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18415,"link":"https://juejin.cn/post/6965464707314860040","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873522000,"realSuperChapterId":53,"selfVisible":0,"shareDate":1621873376000,"shareUser":"鸿洋","superChapterId":76,"superChapterName":"热门专题","tags":[],"title":"【开源篇】组件化+Jetpack+MVVM项目实战，涉及协程+Retrofit，Paging3+Room等","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":94,"chapterName":"事件分发","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18417,"link":"https://juejin.cn/post/6965484155660402702","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873509000,"realSuperChapterId":37,"selfVisible":0,"shareDate":1621873380000,"shareUser":"鸿洋","superChapterId":126,"superChapterName":"自定义控件","tags":[],"title":"【带着问题学】android事件分发8连问","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":313,"chapterName":"字节码","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18418,"link":"https://juejin.cn/post/6965790738990776356","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873500000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1621873390000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"看这一篇，你也可以自如的掌握字节码插桩","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":100,"chapterName":"RecyclerView","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18419,"link":"https://juejin.cn/post/6965633977960890381","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873489000,"realSuperChapterId":39,"selfVisible":0,"shareDate":1621873394000,"shareUser":"鸿洋","superChapterId":55,"superChapterName":"5.+高新技术","tags":[],"title":"RecyclerView 刷新列表数据的 notifyDataSetChanged() 为什么是昂贵的?","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":232,"chapterName":"入门及知识点","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18420,"link":"https://juejin.cn/post/6965687767011426317","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873479000,"realSuperChapterId":231,"selfVisible":0,"shareDate":1621873404000,"shareUser":"鸿洋","superChapterId":232,"superChapterName":"Kotlin","tags":[],"title":"【译】Dagger，Hilt 以及 Koin 的本质区别是什么？","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18427,"link":"https://mp.weixin.qq.com/s/UQIC8-SjASHUZkDI97RiWQ","niceDate":"1天前","niceShareDate":"11小时前","origin":"","prefix":"","projectLink":"","publishTime":1621872000000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1621953470000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"不需要权限的悬浮窗方案了解一下~","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"郭霖","canEdit":false,"chapterId":409,"chapterName":"郭霖","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18428,"link":"https://mp.weixin.qq.com/s/w2cmy8SqwaG5hLuM7Sdx3w","niceDate":"1天前","niceShareDate":"11小时前","origin":"","prefix":"","projectLink":"","publishTime":1621872000000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1621953485000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/409/1"}],"title":"在Android手机上对https请求进行抓包","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"fuusy","canEdit":false,"chapterId":294,"chapterName":"完整项目","collect":false,"courseId":13,"desc":"该项目主要以组件化+Jetpack+MVVM为架构，使用Kotlin语言，集合了更新的Jetpack组件，如Navigation、Paging3、Room等，另外还加上了依赖注入框架Koin和图片加载框架Coin。\r\n网络请求部分使用OkHttp+Retrofit，配合Kotlin的协程，完成了对Retrofit和协程的请求封装，结合LoadSir进行状态切换管理\r\n\r\n","descMd":"","envelopePic":"https://www.wanandroid.com/resources/image/pc/default_project_img.jpg","fresh":false,"host":"","id":18414,"link":"https://www.wanandroid.com/blog/show/3009","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"https://github.com/fuusy/wanandroid_jetpack_kt","publishTime":1621868542000,"realSuperChapterId":293,"selfVisible":0,"shareDate":1621868542000,"shareUser":"","superChapterId":294,"superChapterName":"开源项目主Tab","tags":[{"name":"项目","url":"/project/list/1?cid=294"}],"title":"组件化+Jetpack+MVVM项目实战，涉及Jetpack相关组件，协程+Retrofit，Paging3+Room等","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18412,"link":"https://mp.weixin.qq.com/s/iy5sU9NnqgzJweUFxxvrAg","niceDate":"2天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621785600000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1621868452000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"微信团队自研的APM利器，Matrix性能监控日志探索","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18393,"link":"https://www.jianshu.com/p/ed030e66c00b","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1621736958000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621736958000,"shareUser":"遥望星空forward","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"OKHttp源码解析","type":0,"userId":90516,"visible":1,"zan":0}],"offset":0,"over":false,"pageCount":527,"size":20,"total":10530}
/// errorCode : 0
/// errorMsg : ""

class ArticlesResponse {
  Articles? data;
  int? errorCode;
  String? errorMsg;

  ArticlesResponse({this.data, this.errorCode, this.errorMsg});

  ArticlesResponse.fromJson(dynamic json) {
    data = json["data"] != null ? Articles.fromJson(json["data"]) : null;
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }
}

/// curPage : 1
/// datas : [{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":197,"chapterName":"Native Crash","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18433,"link":"https://juejin.cn/post/6966169836703449119","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621959501000,"realSuperChapterId":53,"selfVisible":0,"shareDate":1621959449000,"shareUser":"鸿洋","superChapterId":76,"superChapterName":"热门专题","tags":[],"title":"ART虚拟机 | Android应用中SIGSEGV信号的处理流程","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":320,"chapterName":"内存管理","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18431,"link":"https://www.jianshu.com/p/cae73cc45346","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621959489000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1621959431000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"Android GC 简史","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":320,"chapterName":"内存管理","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18432,"link":"https://www.jianshu.com/p/6239672cf0d5","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621959480000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1621959443000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"针对「内存抖动」的一次测试","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18429,"link":"/blog/show/3010","niceDate":"9小时前","niceShareDate":"9小时前","origin":"","prefix":"","projectLink":"","publishTime":1621958400000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1621959000000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2021-05-19 ~ 2021-05-26）","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18424,"link":"https://juejin.cn/post/6966079368820949029","niceDate":"19小时前","niceShareDate":"19小时前","origin":"","prefix":"","projectLink":"","publishTime":1621924114000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621924114000,"shareUser":"请叫我齐岛主","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"优化Glide加载超大gif图","type":0,"userId":94852,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18423,"link":"https://juejin.cn/post/6966057952961069069/","niceDate":"22小时前","niceShareDate":"22小时前","origin":"","prefix":"","projectLink":"","publishTime":1621912002000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621912002000,"shareUser":"xll","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"LeetCode刷题笔记710黑名单中的随机数------我终于弄懂了官方解题思路","type":0,"userId":22903,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18422,"link":"https://juejin.cn/post/6844904038513770510","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621906056000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621906056000,"shareUser":"躬行之","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"设计模式之外观设计模式","type":0,"userId":23270,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":185,"chapterName":"组件化","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18415,"link":"https://juejin.cn/post/6965464707314860040","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873522000,"realSuperChapterId":53,"selfVisible":0,"shareDate":1621873376000,"shareUser":"鸿洋","superChapterId":76,"superChapterName":"热门专题","tags":[],"title":"【开源篇】组件化+Jetpack+MVVM项目实战，涉及协程+Retrofit，Paging3+Room等","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":94,"chapterName":"事件分发","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18417,"link":"https://juejin.cn/post/6965484155660402702","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873509000,"realSuperChapterId":37,"selfVisible":0,"shareDate":1621873380000,"shareUser":"鸿洋","superChapterId":126,"superChapterName":"自定义控件","tags":[],"title":"【带着问题学】android事件分发8连问","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":313,"chapterName":"字节码","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18418,"link":"https://juejin.cn/post/6965790738990776356","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873500000,"realSuperChapterId":244,"selfVisible":0,"shareDate":1621873390000,"shareUser":"鸿洋","superChapterId":245,"superChapterName":"Java深入","tags":[],"title":"看这一篇，你也可以自如的掌握字节码插桩","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":100,"chapterName":"RecyclerView","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18419,"link":"https://juejin.cn/post/6965633977960890381","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873489000,"realSuperChapterId":39,"selfVisible":0,"shareDate":1621873394000,"shareUser":"鸿洋","superChapterId":55,"superChapterName":"5.+高新技术","tags":[],"title":"RecyclerView 刷新列表数据的 notifyDataSetChanged() 为什么是昂贵的?","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":232,"chapterName":"入门及知识点","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18420,"link":"https://juejin.cn/post/6965687767011426317","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621873479000,"realSuperChapterId":231,"selfVisible":0,"shareDate":1621873404000,"shareUser":"鸿洋","superChapterId":232,"superChapterName":"Kotlin","tags":[],"title":"【译】Dagger，Hilt 以及 Koin 的本质区别是什么？","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18427,"link":"https://mp.weixin.qq.com/s/UQIC8-SjASHUZkDI97RiWQ","niceDate":"1天前","niceShareDate":"11小时前","origin":"","prefix":"","projectLink":"","publishTime":1621872000000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1621953470000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"不需要权限的悬浮窗方案了解一下~","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"郭霖","canEdit":false,"chapterId":409,"chapterName":"郭霖","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18428,"link":"https://mp.weixin.qq.com/s/w2cmy8SqwaG5hLuM7Sdx3w","niceDate":"1天前","niceShareDate":"11小时前","origin":"","prefix":"","projectLink":"","publishTime":1621872000000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1621953485000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/409/1"}],"title":"在Android手机上对https请求进行抓包","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"fuusy","canEdit":false,"chapterId":294,"chapterName":"完整项目","collect":false,"courseId":13,"desc":"该项目主要以组件化+Jetpack+MVVM为架构，使用Kotlin语言，集合了更新的Jetpack组件，如Navigation、Paging3、Room等，另外还加上了依赖注入框架Koin和图片加载框架Coin。\r\n网络请求部分使用OkHttp+Retrofit，配合Kotlin的协程，完成了对Retrofit和协程的请求封装，结合LoadSir进行状态切换管理\r\n\r\n","descMd":"","envelopePic":"https://www.wanandroid.com/resources/image/pc/default_project_img.jpg","fresh":false,"host":"","id":18414,"link":"https://www.wanandroid.com/blog/show/3009","niceDate":"1天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"https://github.com/fuusy/wanandroid_jetpack_kt","publishTime":1621868542000,"realSuperChapterId":293,"selfVisible":0,"shareDate":1621868542000,"shareUser":"","superChapterId":294,"superChapterName":"开源项目主Tab","tags":[{"name":"项目","url":"/project/list/1?cid=294"}],"title":"组件化+Jetpack+MVVM项目实战，涉及Jetpack相关组件，协程+Retrofit，Paging3+Room等","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","canEdit":false,"chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18412,"link":"https://mp.weixin.qq.com/s/iy5sU9NnqgzJweUFxxvrAg","niceDate":"2天前","niceShareDate":"1天前","origin":"","prefix":"","projectLink":"","publishTime":1621785600000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1621868452000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"微信团队自研的APM利器，Matrix性能监控日志探索","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":18393,"link":"https://www.jianshu.com/p/ed030e66c00b","niceDate":"2天前","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1621736958000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1621736958000,"shareUser":"遥望星空forward","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"OKHttp源码解析","type":0,"userId":90516,"visible":1,"zan":0}]
/// offset : 0
/// over : false
/// pageCount : 527
/// size : 20
/// total : 10530

class Articles {
  int? curPage;
  List<Article>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  Articles({this.curPage, this.datas, this.offset, this.over, this.pageCount, this.size, this.total});

  bool get hasMore => over == false;

  Articles.fromJson(dynamic json) {
    curPage = json["curPage"];
    if (json["datas"] != null) {
      datas = [];
      json["datas"].forEach((v) {
        datas?.add(Article.fromJson(v));
      });
    }
    offset = json["offset"];
    over = json["over"];
    pageCount = json["pageCount"];
    size = json["size"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = curPage;
    if (datas != null) {
      map["datas"] = datas?.map((v) => v.toJson()).toList();
    }
    map["offset"] = offset;
    map["over"] = over;
    map["pageCount"] = pageCount;
    map["size"] = size;
    map["total"] = total;
    return map;
  }
}

/// apkLink : ""
/// audit : 1
/// author : ""
/// canEdit : false
/// chapterId : 197
/// chapterName : "Native Crash"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : true
/// host : ""
/// id : 18433
/// link : "https://juejin.cn/post/6966169836703449119"
/// niceDate : "9小时前"
/// niceShareDate : "9小时前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1621959501000
/// realSuperChapterId : 53
/// selfVisible : 0
/// shareDate : 1621959449000
/// shareUser : "鸿洋"
/// superChapterId : 76
/// superChapterName : "热门专题"
/// tags : []
/// title : "ART虚拟机 | Android应用中SIGSEGV信号的处理流程"
/// type : 0
/// userId : 2
/// visible : 1
/// zan : 0

class Article {
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  int? originId;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;
  bool? isTop;

  Article(
      {this.apkLink,
      this.audit,
      this.author,
      this.canEdit,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.descMd,
      this.envelopePic,
      this.fresh,
      this.host,
      this.id,
      this.link,
      this.niceDate,
      this.niceShareDate,
      this.origin,
      this.originId,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.realSuperChapterId,
      this.selfVisible,
      this.shareDate,
      this.shareUser,
      this.superChapterId,
      this.superChapterName,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan});

  String formatAuthor() {
    if (this.author != null && this.author!.isNotEmpty) {
      return "作者：${this.author}";
    } else if (this.shareUser != null && this.shareUser!.isNotEmpty) {
      return "分享：${this.shareUser}";
    } else {
      return "匿名";
    }
  }

  String formatTitle() => CommUtils.fromHtml(this.title);

  String formatContent() => CommUtils.fromHtml(this.desc);

  String formatChapter() {
    if (this.superChapterName == null || this.superChapterName!.isEmpty) {
      return this.chapterName.orEmpty;
    } else {
      return "${this.superChapterName.orEmpty} · ${this.chapterName.orEmpty}";
    }
  }

  Article.fromJson(dynamic json) {
    apkLink = json["apkLink"];
    audit = json["audit"];
    author = json["author"];
    canEdit = json["canEdit"];
    chapterId = json["chapterId"];
    chapterName = json["chapterName"];
    collect = json["collect"];
    courseId = json["courseId"];
    desc = json["desc"];
    descMd = json["descMd"];
    envelopePic = json["envelopePic"];
    fresh = json["fresh"];
    host = json["host"];
    id = json["id"];
    link = json["link"];
    niceDate = json["niceDate"];
    niceShareDate = json["niceShareDate"];
    origin = json["origin"];
    originId = json["originId"];
    prefix = json["prefix"];
    projectLink = json["projectLink"];
    publishTime = json["publishTime"];
    realSuperChapterId = json["realSuperChapterId"];
    selfVisible = json["selfVisible"];
    shareDate = json["shareDate"];
    shareUser = json["shareUser"];
    superChapterId = json["superChapterId"];
    superChapterName = json["superChapterName"];
    title = json["title"];
    type = json["type"];
    userId = json["userId"];
    visible = json["visible"];
    zan = json["zan"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apkLink"] = apkLink;
    map["audit"] = audit;
    map["author"] = author;
    map["canEdit"] = canEdit;
    map["chapterId"] = chapterId;
    map["chapterName"] = chapterName;
    map["collect"] = collect;
    map["courseId"] = courseId;
    map["desc"] = desc;
    map["descMd"] = descMd;
    map["envelopePic"] = envelopePic;
    map["fresh"] = fresh;
    map["host"] = host;
    map["id"] = id;
    map["link"] = link;
    map["niceDate"] = niceDate;
    map["niceShareDate"] = niceShareDate;
    map["origin"] = origin;
    map["originId"] = originId;
    map["prefix"] = prefix;
    map["projectLink"] = projectLink;
    map["publishTime"] = publishTime;
    map["realSuperChapterId"] = realSuperChapterId;
    map["selfVisible"] = selfVisible;
    map["shareDate"] = shareDate;
    map["shareUser"] = shareUser;
    map["superChapterId"] = superChapterId;
    map["superChapterName"] = superChapterName;
    map["title"] = title;
    map["type"] = type;
    map["userId"] = userId;
    map["visible"] = visible;
    map["zan"] = zan;
    return map;
  }
}
