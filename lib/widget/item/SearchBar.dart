import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';

class SearchBar extends StatefulWidget {
  final String? content;
  final Function(String)? onSearch;
  final Function(String)? onTextChanged;

  SearchBar({this.content, this.onSearch, this.onTextChanged});

  @override
  State<StatefulWidget> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.content.orEmpty;
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: widget.content.orEmpty.length));
    return Container(
      width: ResDimen.width - 30.w,
      height: ResDimen.barHeight - 10.w,
      margin: EdgeInsets.fromLTRB(15.w, 5.w, 15.w, 5.w),
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(color: ResColors.Line, borderRadius: BorderRadius.all(Radius.circular(ResDimen.halfBarHeight))),
      child: TextField(
        controller: _controller,
        maxLength: 20,
        maxLines: 1,
        cursorColor: ResColors.Black,
        style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark, textBaseline: TextBaseline.alphabetic),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            hintText: "搜点什么吧",
            contentPadding: EdgeInsets.all(0),
            hintStyle: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            counterText: '',
            alignLabelWithHint: true),
        onChanged: (text) {
          if (widget.onTextChanged != null) widget.onTextChanged!(text);
        },
        onSubmitted: (text) {
          if (widget.onSearch != null) widget.onSearch!(text);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
