import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ExampleLottieSize extends StatelessWidget {
  const ExampleLottieSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: FutureBuilder<LottieComposition>(
            future: _loadComposition(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return ErrorWidget(snapshot.error!);
              if (!snapshot.hasData) return const CircularProgressIndicator();
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      _Lottie(
                        snapshot.data!,
                      ),
                      _Lottie(
                        snapshot.data!,
                        width: 200,
                      ),
                      _Lottie(
                        snapshot.data!,
                        height: 200,
                      ),
                      _Lottie(
                        snapshot.data!,
                        width: 200,
                        height: 200,
                        alignment: Alignment.bottomRight,
                      ),
                      _Lottie(
                        snapshot.data!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      _Lottie(
                        snapshot.data!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomRight,
                      ),
                      SizedBox(
                        width: 150,
                        child: _Lottie(snapshot.data!),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: SizedBox(
                          width: 300,
                          height: 150,
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: _Lottie(snapshot.data!)),
                        ),
                      ),
                      IntrinsicHeight(
                        child: _Lottie(
                          snapshot.data!,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Align(child: _Lottie(snapshot.data!)),
                      ),
                      IntrinsicWidth(
                        child: _Lottie(
                          snapshot.data!,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

Future<LottieComposition> _loadComposition() async {
  var assetData = await rootBundle.load('assets/lf20_w2Afea.json');
  return LottieComposition.fromByteData(assetData);
}

class _Lottie extends StatefulWidget {
  final LottieComposition composition;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;

  const _Lottie(this.composition,
      {Key? key, this.width, this.height, this.fit, this.alignment})
      : super(key: key);

  @override
  __LottieState createState() => __LottieState();
}

class __LottieState extends State<_Lottie> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.composition.duration)
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Lottie(
          composition: widget.composition,
          controller: _controller,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          alignment: widget.alignment,
        ),
      ),
    );
  }
}
