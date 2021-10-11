import 'package:flutter/material.dart';
import 'package:flutter_image_demo/example/common/app_bar.dart';
import 'package:flutter_image_demo/example/common/ex_button.dart';
import 'package:flutter_image_demo/example/setting_screen.dart';
import 'example_image_cache_page.dart';
import 'example_photo_view_page.dart';
import 'example_lottie_page.dart';
import 'example_svg_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(title: 'Flutter_Image_Demo'),
          Expanded(
            child: Column(
              children: <Widget>[
                ButtonItemNode(
                  text: 'Network image',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExampleImageCachePage()),
                    );
                  },
                ),
                ButtonItemNode(
                  text: 'Preview image',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExamplePhotoViewPage()),
                    );
                  },
                ),
                ButtonItemNode(
                  text: 'Svg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExampleSvgPage()),
                    );
                  },
                ),
                ButtonItemNode(
                  text: 'Lottie',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExampleLottiePage()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ExampleSettingCache()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
