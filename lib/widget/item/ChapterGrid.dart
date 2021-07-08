import 'package:flutter/material.dart';
import 'package:wan/entity/remote/ChaptersResponse.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/home/chapter/ChapterPage.dart';
import 'package:wan/widget/custom/CacheImage.dart';

class ChapterGrid extends StatefulWidget {
  final List<Chapter> chapters;

  ChapterGrid(this.chapters);

  @override
  State<StatefulWidget> createState() => _ChapterGrid();
}

class _ChapterGrid extends State<ChapterGrid> {
  @override
  Widget build(BuildContext context) {
    var chapters = widget.chapters;
    if (chapters.length >= 8) {
      chapters = chapters.sublist(0, 7);
      chapters.add(Chapter(id: 0, name: "更多"));
    }
    if (chapters.isNullOrEmpty) {
      return Container(width: 0, height: 0);
    }
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          color: ResColors.White,
          height: ResDimen.quarterWidth * (chapters.length / 4).ceil(),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                var chapter = chapters[index];
                return Container(
                  width: ResDimen.quarterWidth,
                  height: ResDimen.quarterWidth,
                  child: InkWell(
                      onTap: () {
                        RouteManager.push(ChapterPage(chapter.id ?? 0));
                      },
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(child: CacheImage(DataManager.getAvatar(chapter.id), width: 30.w, height: 30.w)),
                            Container(
                                padding: EdgeInsets.only(top: 10.r),
                                child: Text(
                                  chapter.name.orEmpty,
                                  style: TextStyle(color: ResColors.TextNormal, fontSize: ResDimen.textSmall),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ))
                          ])),
                );
              }),
        ));
  }
}
