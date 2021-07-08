import 'package:flutter/material.dart';
import 'package:wan/res/Res.dart';
import 'package:wan/tools/Tools.dart';

class TitleBar extends AppBar {
  TitleBar(String title,
      {bool showBack = true,
      Widget? leading,
      List<Widget>? actions,
      PreferredSizeWidget? bottom,
      VoidCallback? onTitleTap,
      Color? backgroundColor})
      : super(
            title: GestureDetector(
              onTap: () {
                if (onTitleTap != null) {
                  onTitleTap();
                }
              },
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: ResDimen.textLarge, fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            backgroundColor: backgroundColor == null ? Colors.white : backgroundColor,
            leading: showBack
                ? leading ??
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          var context = Utils.getContext();
                          if (context != null) {
                            Navigator.pop(context);
                          }
                        })
                : leading,
            actions:
                (actions.isNullOrEmpty && title.length > 10) ? [Container(width: ResDimen.barHeight, height: ResDimen.barHeight)] : actions,
            bottom: bottom);
}
