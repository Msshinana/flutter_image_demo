import 'package:flutter/material.dart';

import 'package:flutter_image_demo/example/common/app_bar.dart';
import 'package:flutter_image_demo/example/common/ex_button.dart';

import 'examples_lottie/common.dart';
import 'examples_lottie/size.dart';
import 'examples_lottie/animation_controller.dart';
import 'examples_lottie/animation_full_control.dart';
import 'examples_lottie/dynamic_properties.dart';
import 'examples_lottie/dynamic_text.dart';
import 'examples_lottie/hide_after_complete.dart';
import 'examples_lottie/markers.dart';
import 'examples_lottie/repeat.dart';
import 'examples_lottie/run_once.dart';
import 'examples_lottie/control.dart';

class ExampleLottiePage extends StatelessWidget {
  const ExampleLottiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: 'Lottie',
      showGoBack: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExampleButtonNode(
              title: 'common',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieCommon()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'control',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ExampleLottieOperation();
                  }),
                );
              },
            ),
            ExampleButtonNode(
              title: 'size',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ExampleLottieSize();
                  }),
                );
              },
            ),
            ExampleButtonNode(
              title: 'controller',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieController()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'full controller',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieFullControl()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'dynamic properties',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ExampleLottieDynamicProperties()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'dynamic Text',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieDynamicText()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'hide after animation',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ExampleLottieHideAfterComplete()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'markers',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieMarkers()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'repeat',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieRepeat()),
                );
              },
            ),
            ExampleButtonNode(
              title: 'run once',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleLottieRunOnce()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
