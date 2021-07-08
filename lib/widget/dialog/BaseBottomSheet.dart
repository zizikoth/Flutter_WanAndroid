import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan/entity/local/ItemEntity.dart';
import 'package:wan/tools/Tools.dart';

class BaseBottomSheet extends StatefulWidget {
  final String title;
  final List<ItemEntity> list;
  final Function(ItemEntity)? onClick;

  BaseBottomSheet(this.title, this.list, {this.onClick});

  @override
  State<StatefulWidget> createState() => _BaseBottomSheet();
}

class _BaseBottomSheet extends State<BaseBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = ResDimen.height * 0.6;
    var curHeight = (widget.list.length + 1) * ResDimen.barHeight + 40.w;
    if (curHeight < height) {
      height = curHeight;
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20.w),
      height: height,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ResDimen.barHeight,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 10.w, 0, 10.w),
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.black, fontSize: ResDimen.textLarge, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.list.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        children: [
                          if (index != 0) Divider(color: ResColors.Line, height: ResDimen.line),
                          InkWell(
                              onTap: () {
                                if (widget.onClick != null) {
                                  widget.onClick!(widget.list[index]);
                                  RouteManager.pop();
                                }
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: ResDimen.barHeight,
                                  alignment: Alignment.center,
                                  child: Text(widget.list[index].title,
                                      style: TextStyle(color: ResColors.TextNormal, fontSize: ResDimen.textNormal))))
                        ],
                      ))),
        ],
      ),
    );
  }
}
