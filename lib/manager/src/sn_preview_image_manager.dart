import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

enum PreviewOpenType {
  dialog,
  push,
  bottomSheet,
}

class SNPreviewImageWrapper extends StatelessWidget {
  const SNPreviewImageWrapper({
    required this.imageUrl,
    this.svgEnable = false,
    this.previewEnable = false,
    this.previewOpenType,
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.basePosition = Alignment.center,
    this.filterQuality = FilterQuality.none,
    this.disableGestures,
    this.errorBuilder,
  });

  final String imageUrl;
  final bool? svgEnable;
  final bool? previewEnable;
  final PreviewOpenType? previewOpenType;

  final ImageProvider? imageProvider;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool? disableGestures;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    if (previewEnable == false) {
      return _previewImageChild();
    }
    return GestureDetector(
      onTap: () {
        switch (previewOpenType) {
          case PreviewOpenType.dialog:
            _openDialog(context);
            break;
          case PreviewOpenType.push:
            _openPush(context);
            break;
          case PreviewOpenType.bottomSheet:
            _openBottomSheet(context);
            break;
          default:
            _openDialog(context);
        }
      },
      child: _previewImageChild(),
    );
  }

  Widget _previewImageChild() {
    return ((svgEnable == true && imageUrl.endsWith('.svg')) == true)
        ? PhotoView.customChild(
            child: SvgPicture.network(imageUrl),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
          );
  }

  void _openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(0),
            child: ((svgEnable == true && imageUrl.endsWith('.svg')) == true)
                ? PhotoView.customChild(
                    child: SvgPicture.network(imageUrl),
                    childSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.width * 16 / 9),
                    tightMode: true,
                    minScale: minScale ?? PhotoViewComputedScale.contained,
                    maxScale: maxScale ?? PhotoViewComputedScale.covered * 2.0,
                    backgroundDecoration: backgroundDecoration,
                    initialScale: initialScale,
                    basePosition: basePosition,
                    filterQuality: filterQuality,
                    disableGestures: disableGestures,
                  )
                : PhotoView(
                    tightMode: true,
                    imageProvider: CachedNetworkImageProvider(imageUrl),
                    minScale: minScale ?? PhotoViewComputedScale.contained,
                    maxScale: maxScale ?? PhotoViewComputedScale.covered * 2.0,
                    loadingBuilder: loadingBuilder,
                    backgroundDecoration: backgroundDecoration,
                    initialScale: initialScale,
                    basePosition: basePosition,
                    filterQuality: filterQuality,
                    disableGestures: disableGestures,
                    errorBuilder: errorBuilder,
                  ),
          );
        },
      );

  void _openPush(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _snPreviewWrapper(),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) => showBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        shape: const ContinuousRectangleBorder(),
        builder: (BuildContext context) {
          return PhotoViewGestureDetectorScope(
            axis: Axis.vertical,
            child: _snPreviewWrapper(),
          );
        },
      );

  Widget _snPreviewWrapper() {
    return ((svgEnable == true && imageUrl.endsWith('.svg')) == true)
        ? PhotoView.customChild(
            child: SvgPicture.network(imageUrl),
            minScale: minScale,
            maxScale: maxScale,
            backgroundDecoration: backgroundDecoration,
            initialScale: initialScale,
            basePosition: basePosition,
            filterQuality: filterQuality,
            disableGestures: disableGestures,
          )
        : PhotoView(
            imageProvider: CachedNetworkImageProvider(imageUrl),
            minScale: minScale,
            maxScale: maxScale,
            loadingBuilder: loadingBuilder,
            backgroundDecoration: backgroundDecoration,
            initialScale: initialScale,
            basePosition: basePosition,
            filterQuality: filterQuality,
            disableGestures: disableGestures,
            errorBuilder: errorBuilder,
          );
  }
}
