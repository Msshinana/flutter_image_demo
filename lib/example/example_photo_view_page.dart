import 'package:flutter/material.dart';
import 'package:flutter_image_demo/example/common/app_bar.dart';
import 'package:flutter_image_demo/example/common/ex_button.dart';
import 'package:flutter_image_demo/example/common/ex_wrapper.dart';
import 'package:flutter_image_demo/manager/sn_image_manager.dart';

class ExamplePhotoViewPage extends StatelessWidget {
  const ExamplePhotoViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: 'Photo View Demo',
            showGoBack: true,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ExampleButtonNode(
                  title: 'Preview Picture',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExamplePhotoViewCommon()),
                    );
                  },
                ),
                ExampleButtonNode(
                  title: 'Gallery',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ExamplePhotoViewGallery()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExamplePhotoViewCommon extends StatelessWidget {
  const ExamplePhotoViewCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: '图片预览',
      showGoBack: true,
      child: ListView(
        children: const <Widget>[
          ExamplePreviewPictureWrapper(
            title: 'dialog🔽',
            child: SNPreviewImageWrapper(
              imageUrl: 'https://loremflickr.com/320/240/music?lock=1',
              previewEnable: true,
              previewOpenType: PreviewOpenType.dialog,
            ),
          ),
          ExamplePreviewPictureWrapper(
            title: 'push🔽',
            child: SNPreviewImageWrapper(
              imageUrl: 'https://loremflickr.com/320/240/music?lock=2',
              previewEnable: true,
              previewOpenType: PreviewOpenType.push,
            ),
          ),
          ExamplePreviewPictureWrapper(
            title: 'bottomsheet🔽',
            child: SNPreviewImageWrapper(
              imageUrl: 'https://loremflickr.com/320/240/music?lock=3',
              previewEnable: true,
              previewOpenType: PreviewOpenType.bottomSheet,
            ),
          ),
          ExamplePreviewPictureWrapper(
            title: 'SVG🔽',
            child: SNPreviewImageWrapper(
              imageUrl:
                  'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg',
              previewEnable: true,
              svgEnable: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ExamplePhotoViewGallery extends StatefulWidget {
  const ExamplePhotoViewGallery({Key? key}) : super(key: key);

  @override
  _ExamplePhotoViewGalleryState createState() =>
      _ExamplePhotoViewGalleryState();
}

class _ExamplePhotoViewGalleryState extends State<ExamplePhotoViewGallery> {
  bool verticalGallery = false;

  final List images = [
    'https://loremflickr.com/320/240/music?lock=10',
    'https://loremflickr.com/320/240/music?lock=11',
    'https://loremflickr.com/320/240/music?lock=12',
    'https://loremflickr.com/320/240/music?lock=13',
    'https://loremflickr.com/320/240/music?lock=14',
    'https://loremflickr.com/320/240/music?lock=15',
    'https://loremflickr.com/320/240/music?lock=16',
    'https://loremflickr.com/320/240/music?lock=17',
    'https://loremflickr.com/320/240/music?lock=18',
  ];
  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
        title: 'Gallery',
        showGoBack: true,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Text("Vertical"),
                Checkbox(
                  value: verticalGallery,
                  onChanged: (value) {
                    setState(() {
                      verticalGallery = value!;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) =>
                    SNPreviewImageGallery(
                  imageUrl: images[index],
                  galleryItems: images,
                  initialIndex: index,
                  verticalGallery: verticalGallery,
                ),
              ),
            )
          ],
        ));
  }
}
