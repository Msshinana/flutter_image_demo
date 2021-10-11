import 'package:flutter/material.dart';
import 'package:flutter_image_demo/example/common/app_bar.dart';

class ExamplePreviewPictureWrapper extends StatelessWidget {
  const ExamplePreviewPictureWrapper({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        Container(
            width: 200,
            height: 150,
            margin: const EdgeInsets.only(
              top: 10.0,
              bottom: 20.0,
            ),
            child: child)
      ],
    );
  }
}

class ExampleNetworkImageWrapper extends StatelessWidget {
  const ExampleNetworkImageWrapper({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: '',
      showGoBack: true,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 180,
          child: child,
        ),
      ),
    );
  }
}
