import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/CacheImage.dart';

class ArticleItem extends StatefulWidget {
  final Article article;
  final bool enableSlide;
  final bool showDelete;
  final bool showMore;
  final SlidableController? slidableController;
  final Function(Article)? onDelete;
  final Function(Article)? onMore;

  ArticleItem(this.article,
      {this.enableSlide = false, this.slidableController, this.showDelete = true, this.showMore = false, this.onDelete, this.onMore});

  @override
  State<StatefulWidget> createState() => _ArticleItem();
}

class _ArticleItem extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    var article = widget.article;
    var bgColor;
    if (article.isTop == true) {
      bgColor = ResColors.LightPink;
    } else {
      bgColor = ResColors.White;
    }
    return Container(
      color: bgColor,
      child: Column(
        children: [
          Slidable(
            controller: widget.slidableController,
            actionPane: SlidableDrawerActionPane(),
            enabled: widget.enableSlide,
            child: GestureDetector(
              onTap: () {
                RouteManager.startWeb(article.formatTitle(), article.link.orEmpty);
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: ResDimen.w15, bottom: ResDimen.w15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // 作者
                              Container(
                                margin: EdgeInsets.only(left: ResDimen.w15, right: ResDimen.w15),
                                child: Row(
                                  children: [
                                    ClipOval(
                                        child:
                                            CacheImage(DataManager.getAvatar(article.userId), width: ResDimen.w25, height: ResDimen.w25)),
                                    Padding(
                                        padding: EdgeInsets.only(left: ResDimen.w15),
                                        child: Text(
                                          article.formatAuthor(),
                                          style: TextStyle(color: ResColors.TextNormal, fontSize: ResDimen.textSmall),
                                        ))
                                  ],
                                ),
                              ),
                              // 标题
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: ResDimen.w10, left: ResDimen.w15, right: ResDimen.w15),
                                child: Text(
                                  article.formatTitle(),
                                  style: TextStyle(fontWeight: FontWeight.bold, color: ResColors.TextDark, fontSize: ResDimen.textNormal),
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // 内容
                              Visibility(
                                visible: article.desc.isNotNullOrEmpty,
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: ResDimen.w10, left: ResDimen.w15, right: ResDimen.w15),
                                  child: Text(
                                    article.formatContent(),
                                    style: TextStyle(color: ResColors.TextNormal, fontSize: ResDimen.textNormal),
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                            visible: article.envelopePic.isNotNullOrEmpty,
                            child: Padding(
                              padding: EdgeInsets.only(right: ResDimen.w15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.w),
                                child: CacheImage(article.envelopePic.orEmpty, width: 60.w, height: 90.w),
                              ),
                            ))
                      ],
                    ),
                  ),
                  // 标签 + 时间
                  Container(
                    padding: EdgeInsets.fromLTRB(ResDimen.w15, 0, ResDimen.w15, ResDimen.w15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(article.formatChapter(), style: TextStyle(color: ResColors.TextLight, fontSize: ResDimen.textSmall)),
                        Text(article.niceDate!, style: TextStyle(color: ResColors.TextLight, fontSize: ResDimen.textSmall))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            secondaryActions: [
              if (widget.showDelete)
                Container(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Container(
                      width: 70.w,
                      height: 70.w,
                      child: IconSlideAction(
                        caption: '删除',
                        icon: Icons.delete_forever,
                        foregroundColor: ResColors.White,
                        color: ResColors.ArticleDelete,
                        onTap: () {
                          Slidable.of(context)?.close();
                          if (widget.onDelete != null) {
                            widget.onDelete!(article);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              if (widget.showMore)
                Container(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Container(
                      width: 70.w,
                      height: 70.w,
                      child: IconSlideAction(
                        caption: '更多',
                        icon: Icons.more_horiz,
                        foregroundColor: ResColors.White,
                        color: ResColors.ArticleMore,
                        onTap: () {
                          Slidable.of(context)?.close();
                          if (widget.onMore != null) {
                            widget.onMore!(article);
                          }
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // 分割线
          Container(
            color: ResColors.Line,
            height: ResDimen.w5,
          )
        ],
      ),
    );
  }
}
