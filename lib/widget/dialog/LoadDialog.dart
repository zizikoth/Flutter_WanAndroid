import 'package:flutter/material.dart';
import 'package:wan/res/Res.dart';

class LoadDialog extends StatefulWidget {
  final String tip;

  LoadDialog({required this.tip});

  @override
  State<StatefulWidget> createState() => _LoadDialog();
}

class _LoadDialog extends State<LoadDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ResColors.White, borderRadius: BorderRadius.all(Radius.circular(ResDimen.w10))),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            Container(
              margin: EdgeInsets.only(top: ResDimen.w15),
              child: Text(widget.tip,
                  style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark, decoration: TextDecoration.none)),
            )
          ],
        ),
      ),
    );
  }
}
