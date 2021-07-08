import 'package:flutter/material.dart';
import 'package:wan/res/Res.dart';

class TipDialog extends StatefulWidget {
  TipDialog({required this.title, required this.content, required this.onPositive, required this.onNegative});

  final String title;
  final String content;
  final Function onPositive;
  final Function onNegative;

  @override
  State<StatefulWidget> createState() => _TipDialog();
}

class _TipDialog extends State<TipDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 标题
            _buildTitle(),

            /// 内容
            _buildContent(),

            /// 分割线
            _buildDivider(),

            /// 取消确定
            _buildFooter(),
          ],
        ));
  }

  Widget _buildTitle() {
    return Padding(
        padding: EdgeInsets.all(ResDimen.w15),
        child: Text(this.widget.title, style: TextStyle(color: Color(0xff333333), fontSize: ResDimen.textLarge)));
  }

  Widget _buildContent() {
    return Visibility(
      visible: this.widget.content.isNotEmpty,
      child: Container(
        padding: EdgeInsets.only(left: ResDimen.w15, right: ResDimen.w15, bottom: ResDimen.w15),
        child: Text(
          this.widget.content,
          style: TextStyle(color: Color(0xff666666), fontSize: ResDimen.textNormal),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 0.1, color: Color(0xffeeeeee));
  }

  Widget _buildFooter() {
    return Container(
        height: 50,
        child: Flex(direction: Axis.horizontal, children: [
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  this.widget.onNegative();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("取消", style: TextStyle(color: ResColors.TextDark, fontSize: ResDimen.textNormal)),
                )),
          ),
          VerticalDivider(width: 0.1, color: Color(0xffeeeeee)),
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  this.widget.onPositive();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("确定", style: TextStyle(color: ResColors.Red, fontSize: ResDimen.textNormal)),
                )),
          ),
        ]));
  }
}
