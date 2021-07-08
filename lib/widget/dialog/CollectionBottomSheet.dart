import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';

class CollectionBottomSheet extends StatefulWidget {
  final Function(String title, String author, String link) _onSubmit;

  CollectionBottomSheet(this._onSubmit);

  @override
  State<StatefulWidget> createState() => _CollectionBottomSheet();
}

class _CollectionBottomSheet extends State<CollectionBottomSheet> {
  String _title = "";
  String _author = "";
  String _link = "";

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: ResDimen.height * 0.8,
        padding: EdgeInsets.all(15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: ResDimen.toolBarHeight,
              alignment: Alignment.center,
              child: Text(
                "文章收藏",
                style: TextStyle(color: Colors.black, fontSize: ResDimen.textLarge, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                TextField(
                    maxLines: 1,
                    maxLength: 50,
                    cursorColor: ResColors.TextDark,
                    decoration: InputDecoration(
                        hintText: "请输入标题",
                        hintStyle: TextStyle(color: ResColors.TextLight),
                        labelText: "请输入标题",
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(color: ResColors.TextLight),
                        counterStyle: TextStyle(color: ResColors.TextLight),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                    onChanged: (value) {
                      _title = value;
                    }),
                Container(height: 20.w),
                TextField(
                    maxLines: 1,
                    maxLength: 10,
                    cursorColor: ResColors.TextDark,
                    decoration: InputDecoration(
                        hintText: "请输入作者",
                        hintStyle: TextStyle(color: ResColors.TextLight),
                        labelText: "请输入作者",
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(color: ResColors.TextLight),
                        counterStyle: TextStyle(color: ResColors.TextLight),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                    onChanged: (value) {
                      _author = value;
                    }),
                Container(height: 20.w),
                TextField(
                    minLines: 3,
                    maxLines: 3,
                    maxLength: 100,
                    cursorColor: ResColors.TextDark,
                    scrollPhysics: BouncingScrollPhysics(),
                    decoration: InputDecoration(
                        hintText: "请输入文章链接",
                        hintStyle: TextStyle(color: ResColors.TextLight),
                        alignLabelWithHint: true,
                        labelText: "请输入文章链接",
                        labelStyle: TextStyle(color: ResColors.TextLight),
                        counterStyle: TextStyle(color: ResColors.TextLight),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                    onChanged: (value) {
                      _link = value;
                    }),
              ],
            ))),
            Container(
              padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
              child: MaterialButton(
                minWidth: ResDimen.width - 40.w,
                color: ResColors.Black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(15),
                child: Text("提交", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.White)),
                onPressed: () {
                  if (_title.isEmpty) {
                    TipUtils.toast("请输入标题");
                  } else if (_author.isEmpty) {
                    TipUtils.toast("请输入作者");
                  } else if (_link.isEmpty) {
                    TipUtils.toast("请输入文章链接");
                  } else {
                    RouteManager.pop();
                    widget._onSubmit(_title, _author, _link);
                  }
                },
              ),
            ),
          ],
        ),
      );
}
