import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_image_demo/example/src/all_files.g.dart';
import 'package:flutter_image_demo/example/common/ex_wrapper.dart';

class ExampleLottieOperation extends StatelessWidget {
  const ExampleLottieOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('control')),
      body: GridView.builder(
        itemCount: files.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          var assetName = files[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (context) => Detail(assetName)));
            },
            child: ExampleItemWrapper(
              child: Lottie.asset(
                assetName,
                frameBuilder: (context, child, composition) {
                  return AnimatedOpacity(
                    opacity: composition == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Detail extends StatefulWidget {
  final String assetName;

  const Detail(this.assetName, {Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.assetName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                widget.assetName,
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.repeat();
                },
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => Row(
                children: <Widget>[
                  Expanded(
                    child: Slider(
                      value: _controller.value,
                      onChanged: (newValue) {
                        _controller.value = newValue;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(_controller.isAnimating
                        ? Icons.stop
                        : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        if (_controller.isAnimating) {
                          _controller.stop();
                        } else {
                          _controller.repeat();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
