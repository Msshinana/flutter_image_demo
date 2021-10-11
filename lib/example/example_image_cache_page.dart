import 'package:flutter/material.dart';
import 'package:flutter_image_demo/example/common/app_bar.dart';
import 'common/ex_button.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_image_demo/manager/sn_image_manager.dart';
import 'package:flutter_image_demo/example/common/ex_wrapper.dart';

class ExampleImageCachePage extends StatelessWidget {
  const ExampleImageCachePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: 'Network image',
      showGoBack: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ExampleButtonNode(
                title: 'ImageProvider',
                onPressed: () {
                  _openNetworkImageProvider(context);
                }),
            ExampleButtonNode(
                title: 'BlurHashImage',
                onPressed: () {
                  _openBlurHashImage(context);
                }),
            ExampleButtonNode(
                title: 'CircularProgressIndicator',
                onPressed: () {
                  _openCircularProgressIndicator(context);
                }),
            ExampleButtonNode(
                title: 'DecorationImage',
                onPressed: () {
                  _openDecorationImage(context);
                }),
            ExampleButtonNode(
                title: 'CircleAvatar',
                onPressed: () {
                  _openCircleAvatar(context);
                }),
            ExampleButtonNode(
                title: 'FadeOutAnimation',
                onPressed: () {
                  _openFadeOutAnimation(context);
                }),
            ExampleButtonNode(
                title: 'svg',
                onPressed: () {
                  _openSvgImage(context);
                }),
            ExampleButtonNode(
                title: 'NotAvalidUrl',
                onPressed: () {
                  _openNotValideUrl(context);
                }),
          ],
        ),
      ),
    );
  }
}

void _openNetworkImageProvider(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ExampleNetworkImageWrapper(
        child: Image(
          image: CachedNetworkImageProvider(
            'https://loremflickr.com/320/240/music?lock=0',
          ),
        ),
      ),
    ),
  );
}

void _openBlurHashImage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          placeholder: AspectRatio(
            aspectRatio: 1.6,
            child: BlurHash(hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
          ),
          imageUrl: 'https://loremflickr.com/320/240/music?lock=1',
          fit: BoxFit.cover,
          svgEnable: true,
        ),
      ),
    ),
  );
}

void _openCircularProgressIndicator(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
          imageUrl: 'https://blurha.sh/assets/images/img1.jpg',
        ),
      ),
    ),
  );
}

void _openDecorationImage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          imageUrl: 'https://via.placeholder.com/300x150',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.pink,
                  BlendMode.colorBurn,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}

void _openCircleAvatar(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          imageUrl: 'https://loremflickr.com/320/240/music?lock=3',
          placeholder: const CircleAvatar(
            // backgroundImage: ,
            backgroundColor: Colors.amber,
            radius: 150,
          ),
          imageBuilder: (context, image) => CircleAvatar(
            backgroundImage: image,
            radius: 150,
          ),
        ),
      ),
    ),
  );
}

void _openFadeOutAnimation(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          maxHeightDiskCache: 180,
          imageUrl: 'https://loremflickr.com/320/240/music?lock=4',
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fadeOutDuration: const Duration(seconds: 1),
          fadeInDuration: const Duration(seconds: 3),
        ),
      ),
    ),
  );
}

void _openSvgImage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          imageUrl:
              'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg',
          svgEnable: true,
        ),
      ),
    ),
  );
}

void _openNotValideUrl(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ExampleNetworkImageWrapper(
        child: SNCacheNetworkImage(
          imageUrl: 'https://notAvalid.uri',
        ),
      ),
    ),
  );
}
