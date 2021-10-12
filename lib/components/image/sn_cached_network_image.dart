import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

class SNCachedNetworkImage extends StatelessWidget {
  const SNCachedNetworkImage({
    required this.imageUrl,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeIn,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.placeholderFadeInDuration,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.svgEnable = false,
  });

  final String imageUrl;
  final ImageWidgetBuilder? imageBuilder;
  final Widget? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Duration? placeholderFadeInDuration;
  final Duration? fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  final ImageRepeat repeat;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final bool? svgEnable;

  @override
  Widget build(BuildContext context) {
    return (svgEnable == true && imageUrl.endsWith('.svg'))
        ? SvgPicture.network(
            imageUrl,
            placeholderBuilder: (BuildContext context) =>
                placeholder ?? _defaultPlacehold(),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: imageBuilder,
            placeholder:
                progressIndicatorBuilder != null ? null : _photoViewPlacehold,
            progressIndicatorBuilder: progressIndicatorBuilder,
            errorWidget: errorWidget ?? _defaultErrorBuilder,
            placeholderFadeInDuration: placeholderFadeInDuration,
            fadeOutDuration: fadeOutDuration,
            fadeOutCurve: fadeOutCurve,
            fadeInDuration: fadeInDuration,
            fadeInCurve: fadeInCurve,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            repeat: repeat,
            maxWidthDiskCache: maxWidthDiskCache,
            maxHeightDiskCache: maxHeightDiskCache,
          );
  }

  Widget _photoViewPlacehold(
    BuildContext context,
    String url,
  ) {
    return placeholder ?? _defaultPlacehold();
  }

  Widget _defaultPlacehold() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _defaultErrorBuilder(
    BuildContext context,
    String url,
    dynamic error,
  ) {
    return Center(
      child: Icon(
        Icons.broken_image,
        color: Colors.grey[400],
        size: 40.0,
      ),
    );
  }
}
