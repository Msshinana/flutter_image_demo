import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_image_demo/example/src/all_files.g.dart';

class ExampleLottieRunOnce extends StatefulWidget {
  const ExampleLottieRunOnce({Key? key}) : super(key: key);

  @override
  _ExampleLottieRunOnceState createState() => _ExampleLottieRunOnceState();
}

class _ExampleLottieRunOnceState extends State<ExampleLottieRunOnce>
    with TickerProviderStateMixin {
  int _index = 0;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            ++_index;
          });
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text('$_index'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Lottie.asset(
                  files[_index % files.length],
                  controller: _animationController,
                  onLoaded: (composition) {
                    _animationController
                      ..duration = composition.duration
                      ..reset()
                      ..forward();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
