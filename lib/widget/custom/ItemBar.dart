import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';

class ItemBar extends StatelessWidget {
  final String title;
  final VoidCallback? onClick;
  final String? extra;
  final EdgeInsets? padding;
  final bool? isSelect;

  ItemBar(this.title, {this.extra, this.padding, this.onClick, this.isSelect});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: Container(
        width: double.infinity,
        height: ResDimen.barHeight,
        padding: padding ?? EdgeInsets.only(left: 15.w, right: 5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(title, style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark))),
            Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Text(extra.orEmpty, style: TextStyle(fontSize: ResDimen.textSmall, color: ResColors.TextLight))),
            Icon(isSelect ?? false ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded, color: ResColors.TextNormal)
          ],
        ),
      ));
}
