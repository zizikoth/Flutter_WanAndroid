import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';

class LabelBar extends StatelessWidget {
  final String label;
  final Color color;
  final EdgeInsets? padding;

  LabelBar(this.label, this.color, {this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResDimen.barHeight,
      alignment: Alignment.center,
      padding: padding ?? EdgeInsets.only(left: 15.w, right: 15.w),
      child: Row(
        children: [
          Container(width: 4.w, height: 18.w, color: color),
          Container(width: 15.w),
          Text(label, style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
