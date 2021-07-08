import 'package:flutter/material.dart';
import 'package:wan/entity/remote/WebsiteResponse.dart';
import 'package:wan/tools/Tools.dart';

class WebsiteBottomSheet extends StatefulWidget {
  final Website website;
  final Function(Website) onSubmit;

  WebsiteBottomSheet(this.website, this.onSubmit);

  @override
  State<StatefulWidget> createState() => _WebsiteBottomSheet();
}

class _WebsiteBottomSheet extends State<WebsiteBottomSheet> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  Website _temp = Website();

  @override
  void initState() {
    super.initState();
    _temp.id = widget.website.id;
    _temp.name = widget.website.name;
    _temp.link = widget.website.link;
    _nameController.text = _temp.name.orEmpty;
    _linkController.text = _temp.link.orEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20.w),
      height: ResDimen.height * 0.6,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ResDimen.barHeight,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 10.w, 0, 10.w),
            child: Text(
              _temp.id == null ? '新增' : '修改',
              style: TextStyle(color: Colors.black, fontSize: ResDimen.textLarge, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: TextField(
                      minLines: 1,
                      maxLines: 1,
                      maxLength: 20,
                      cursorColor: ResColors.TextDark,
                      controller: _nameController,
                      scrollPhysics: BouncingScrollPhysics(),
                      style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark),
                      decoration: InputDecoration(
                          labelText: "请输入标题",
                          labelStyle: TextStyle(color: ResColors.TextLight),
                          hintText: "请输入标题",
                          hintStyle: TextStyle(color: ResColors.TextLight),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                      onChanged: (value) {
                        _temp.name = value;
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.w, top: 15.w, right: 15.w),
                  child: TextField(
                      minLines: 1,
                      maxLines: 1,
                      maxLength: 50,
                      cursorColor: ResColors.TextDark,
                      controller: _linkController,
                      scrollPhysics: BouncingScrollPhysics(),
                      style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark),
                      decoration: InputDecoration(
                          labelText: "请输入链接",
                          labelStyle: TextStyle(color: ResColors.TextLight),
                          hintText: "请输入链接",
                          hintStyle: TextStyle(color: ResColors.TextLight),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                      onChanged: (value) {
                        _temp.link = value;
                      }),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
            child: MaterialButton(
              minWidth: ResDimen.width - 40.w,
              color: ResColors.Black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(15),
              child: Text("提交", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.White)),
              onPressed: () {
                Logger.log(_temp);
                if (_temp.name.isNullOrEmpty) {
                  TipUtils.toast("请输入标题");
                } else if (!_temp.link.isHttpUrl) {
                  TipUtils.toast("请输入正确的链接");
                } else {
                  RouteManager.pop();
                  widget.onSubmit(_temp);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _linkController.dispose();
    super.dispose();
  }
}
