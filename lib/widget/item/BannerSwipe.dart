import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:wan/entity/remote/BannerResponse.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/CacheImage.dart';

class BannerSwipe extends StatefulWidget {
  final List<HomeBanner> data;

  BannerSwipe(this.data);

  @override
  State<StatefulWidget> createState() => _BannerSwipe();
}

class _BannerSwipe extends State<BannerSwipe> {
  @override
  Widget build(BuildContext context) {
    if (widget.data.isNullOrEmpty) {
      return Container(width: 0, height: 0);
    }
    return Container(
        width: 1.sw,
        height: 0.5625.sw,
        child: Swiper(
          index: 0,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                var title = widget.data[index].title.orEmpty;
                var url = widget.data[index].url.orEmpty;
                RouteManager.startWeb(title, url);
              },
              child: CacheImage(widget.data[index].imagePath.orEmpty),
            );
          },
          autoplay: true,
          duration: 500,
          itemCount: widget.data.length,
          pagination: SwiperPagination(),
        ));
  }
}
