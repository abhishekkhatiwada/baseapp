import 'package:baseapp/common/widgets/images/cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    required this.fit,
    this.height,
    this.width,
    this.color,
    this.placeholder,
    this.placeholderFit,
    this.alignment = Alignment.center,
    this.customPlaceHolder,
  });

  final String url;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? placeholderFit;
  final String? placeholder;
  final Alignment alignment;
  final Widget? customPlaceHolder;

  @override
  Widget build(BuildContext context) {
    final String urll = url;
    return CachedNetworkImage(
      imageUrl: urll,
      fit: fit,
      height: height,
      width: width,
      color: color,
      alignment: alignment,
      cacheManager: CustomCacheManager.instance,
      errorWidget: (a, b, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? 'cache loading image',
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
      placeholder: (a, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? 'cache loading images',
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
    );
  }
}
