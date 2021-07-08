import 'dart:io';

import 'package:flutter/material.dart';

/// 移除OverScroll的效果
class NoneOverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (getPlatform(context) == TargetPlatform.android || getPlatform(context) == TargetPlatform.fuchsia) {
      return GlowingOverscrollIndicator(
        child: child,
        showLeading: false,
        showTrailing: false,
        axisDirection: axisDirection,
        color: Theme.of(context).accentColor,
      );
    } else {
      return child;
    }
  }

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return GlowingOverscrollIndicator(
        child: child,
        showLeading: false,
        showTrailing: false,
        axisDirection: details.direction,
        color: Theme.of(context).accentColor,
      );
    }
    return super.buildOverscrollIndicator(context, child, details);
  }
}
