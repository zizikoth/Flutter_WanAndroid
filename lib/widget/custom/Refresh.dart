import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshFooter extends CustomFooter {
  final String? idle;

  final String? loading;

  final String? failed;

  final String? noMore;

  RefreshFooter({this.idle, this.loading, this.failed, this.noMore})
      : super(
            height: 40,
            builder: (context, mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text(idle ?? "加载更多");
              } else if (mode == LoadStatus.loading) {
                body = Wrap(
                  spacing: 6,
                  children: [
                    CupertinoActivityIndicator(),
                    Text(loading ?? "正在加载"),
                  ],
                );
              } else if (mode == LoadStatus.failed) {
                body = Text(failed ?? "加载失败，点击重试");
              } else if (mode == LoadStatus.noMore) {
                body = Text(noMore ?? "------ 没有更多数据了 ------");
              } else {
                body = Text(loading ?? "加载更多");
              }
              return Container(
                height: 40,
                alignment: Alignment.center,
                child: Center(child: body),
              );
            });
}
