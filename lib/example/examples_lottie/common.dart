import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_image_demo/example/common/ex_wrapper.dart';

class ExampleLottieCommon extends StatelessWidget {
  const ExampleLottieCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ExamplePreviewPictureWrapper(
              title: 'assets',
              child: Lottie.asset('assets/LottieLogo1.json'),
            ),
            ExamplePreviewPictureWrapper(
              title: 'remote url',
              child: Lottie.network(
                  'https://assets10.lottiefiles.com/datafiles/QeC7XD39x4C1CIj/data.json'),
            ),
            ExamplePreviewPictureWrapper(
              title: 'zip file',
              child: Lottie.asset('assets/lottiefiles/angel.zip'),
            ),
            ExamplePreviewPictureWrapper(
              title: 'no repeat',
              child: Lottie.asset(
                'assets/LottieLogo1.json',
                repeat: false,
              ),
            ),
            ExamplePreviewPictureWrapper(
              title: 'error builder',
              child: Lottie.network(
                'https://example.does.not.exist/lottie.json',
                errorBuilder: (context, exception, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey[400],
                      size: 40.0,
                    ),
                  );
                },
              ),
            ),
            ExamplePreviewPictureWrapper(
              title: 'Shadow',
              child: Lottie.asset(
                'assets/Tests/Fill.json',
                height: 300,
                delegates: LottieDelegates(values: [
                  ValueDelegate.dropShadow(
                    ['**'],
                    value: const DropShadow(
                      color: Colors.blue,
                      direction: 140,
                      distance: 60,
                      radius: 10,
                    ),
                  ),
                ]),
              ),
            ),
            ExamplePreviewPictureWrapper(
              title: 'blur',
              child: Lottie.asset(
                'assets/AndroidWave.json',
                height: 300,
                delegates: LottieDelegates(values: [
                  ValueDelegate.blurRadius(
                    ['**'],
                    value: 20,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
