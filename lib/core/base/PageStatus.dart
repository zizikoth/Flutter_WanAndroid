import 'package:flutter/material.dart';
import 'package:wan/res/Res.dart';

class LoadingState extends StateWidget {
  final String tip;

  LoadingState(this.tip);

  @override
  String bindTipText() => tip;

  @override
  Widget bindTopWidget() => Container(width: 200, height: 200, child: Center(child: CircularProgressIndicator()));
}

class EmptyState extends StateWidget {
  @override
  String bindTipText() => "暂无数据";

  @override
  Widget bindTopWidget() => Image.asset(ResAssets.icon_status_data_empty, width: 200, height: 200);
}

class NetErrorState extends StateWidget {
  NetErrorState(VoidCallback onTap) : super(onTap: onTap);

  @override
  String bindTipText() => "网络异常，点击重试";

  @override
  Widget bindTopWidget() => Image.asset(ResAssets.icon_status_net_error, width: 200, height: 200);
}

class ServerErrorState extends StateWidget {
  ServerErrorState(VoidCallback onTap) : super(onTap: onTap);

  @override
  String bindTipText() => "服务器异常，点击重试";

  @override
  Widget bindTopWidget() => Image.asset(ResAssets.icon_status_server_error, width: 200, height: 200);
}

class WebErrorState extends StateWidget {
  @override
  String bindTipText() => "网页加载失败";

  @override
  Widget bindTopWidget() => Image.asset(ResAssets.icon_status_web_error, width: 200, height: 200);
}

abstract class StateWidget extends StatelessWidget {
  final VoidCallback? onTap;

  Widget bindTopWidget();

  String bindTipText();

  StateWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              bindTopWidget(),
              Container(
                margin: EdgeInsets.only(top: ResDimen.w20),
                child: Text(bindTipText(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: ResDimen.textNormal)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
