import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class SNSvgaplayerWrapper extends StatefulWidget {
  final String imageUrl;
  final Widget? placeholder;
  final SVGAAnimationController? controller;

  const SNSvgaplayerWrapper({
    Key? key,
    required this.imageUrl,
    this.placeholder,
    this.controller,
  }) : super(key: key);

  @override
  _SNSvgaplayerWrapperState createState() => _SNSvgaplayerWrapperState();
}

class _SNSvgaplayerWrapperState extends State<SNSvgaplayerWrapper>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController? animationController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    animationController =
        widget.controller ?? SVGAAnimationController(vsync: this)
          ..addListener(() {
            // refresh
            if (mounted) {
              setState(() {});
            }
          });
    _loadAnimation();
  }

  @override
  void dispose() {
    animationController?.dispose();
    animationController = null;
    super.dispose();
  }

  void _loadAnimation() async {
    // FIXME: may throw error on loading
    final videoItem = await _loadVideoItem(widget.imageUrl);
    if (mounted) {
      setState(() {
        isLoading = false;
        animationController?.videoItem = videoItem;
        _playAnimation();
      });
    }
  }

  void _playAnimation() {
    if (animationController?.isCompleted == true) {
      animationController?.reset();
    }
    animationController?.repeat(); // or animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (animationController == null) return Container();
    return Center(
      child: isLoading
          ? widget.placeholder ?? const CircularProgressIndicator()
          : SVGAImage(animationController!),
    );
  }
}

Future _loadVideoItem(String image) {
  Future Function(String) decoder;
  if (image.startsWith(RegExp(r'https?://'))) {
    decoder = SVGAParser.shared.decodeFromURL;
  } else {
    decoder = SVGAParser.shared.decodeFromAssets;
  }
  return decoder(image);
}
