import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  CacheImage(this.imageUrl, {this.fit = BoxFit.cover, this.width, this.height});

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => new Center(
            child: new CupertinoActivityIndicator(),
          ),
      errorWidget: (context, url, error) => Icon(Icons.error));
}
