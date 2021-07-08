import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan/entity/local/ItemEntity.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/dialog/BaseBottomSheet.dart';
import 'package:wan/widget/dialog/LoadDialog.dart';
import 'package:wan/widget/dialog/TipDialog.dart';

class TipUtils {
  static cancelToast() {
    Fluttertoast.cancel();
  }

  static toast(String? message) {
    if (message.isNotNullOrEmpty) {
      /// 先取消上一个弹窗 然后显示新弹窗
      Fluttertoast.cancel().then((value) => Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: message!,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white));
    }
  }

  static Future showTip(BuildContext context, String title, String content, Function onPositive, Function onNegative) async {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ResDimen.w10))),
              child: TipDialog(
                title: title,
                content: content,
                onPositive: onPositive,
                onNegative: onNegative,
              ),
            ));
  }

  static Future showLoading(BuildContext context, {String tip = "加载中"}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => UnconstrainedBox(
              child: SizedBox(
                width: 120,
                height: 120,
                child: LoadDialog(tip: tip),
              ),
            ));
  }

  static Future showBottomSheet(BuildContext context, String title, List<ItemEntity> list, Function(ItemEntity) onClick) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ResDimen.halfBarHeight),
          topRight: Radius.circular(ResDimen.halfBarHeight),
        )),
        builder: (_) => BaseBottomSheet(title, list, onClick: onClick));
  }

  static Future showWidgetBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ResDimen.halfBarHeight),
          topRight: Radius.circular(ResDimen.halfBarHeight),
        )),
        builder: (_) => widget);
  }
}
