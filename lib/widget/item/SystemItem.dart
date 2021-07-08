import 'package:flutter/material.dart';
import 'package:wan/entity/local/WrapItemEntity.dart';
import 'package:wan/tools/Tools.dart';

class WrapItem extends StatefulWidget {
  final WrapItemEntity item;
  final Function(WrapItemEntity)? onTap;

  WrapItem(this.item, {this.onTap});

  @override
  State<StatefulWidget> createState() => _SystemItem();
}

class _SystemItem extends State<WrapItem> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(item);
          }
        },
        child: item.isTitle == true ? _buildTitle(item) : _buildItem(item));
  }

  /// 构建标题
  Widget _buildTitle(WrapItemEntity item) {
    return Container(
        padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
        height: ResDimen.barHeight,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 3.w,
              height: ResDimen.w15,
              color: ResColors.Black,
              margin: EdgeInsets.only(right: ResDimen.w15),
            ),
            Text(item.title, style: TextStyle(color: ResColors.TextDark, fontSize: ResDimen.textNormal, fontWeight: FontWeight.bold))
          ],
        ));
  }

  /// 构建条目
  Widget _buildItem(WrapItemEntity item) {
    return Container(
      margin: EdgeInsets.fromLTRB(7.5.w, 5.w, 7.5.w, 5.w),
      padding: EdgeInsets.fromLTRB(8.w, 5.w, 8.w, 5.w),
      decoration: BoxDecoration(
          color: ResColors.White,
          borderRadius: BorderRadius.all(Radius.circular(ResDimen.halfBarHeight)),
          border: Border.all(width: 1, color: ResColors.LightGray)),
      child: Text(item.title, textAlign: TextAlign.center, style: TextStyle(color: ResColors.TextNormal, fontSize: ResDimen.textNormal)),
    );
  }
}
