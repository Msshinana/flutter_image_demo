import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'sn_gallery_wrapper.dart';

class SNPreviewImageGallery extends StatelessWidget {
  const SNPreviewImageGallery({
    Key? key,
    required this.imageUrl,
    required this.galleryItems,
    required this.initialIndex,
    this.verticalGallery = false,
  }) : super(key: key);

  final String imageUrl;
  final List galleryItems;
  final int initialIndex;
  final bool verticalGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          _openGallery(context, initialIndex);
        },
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          imageProvider: CachedNetworkImageProvider(imageUrl),
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
        ),
      ),
    );
  }
}
