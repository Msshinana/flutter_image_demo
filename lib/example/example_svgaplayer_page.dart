import 'package:flutter/material.dart';
import 'package:flutter_image_demo/components/sn_image_manager.dart';
import 'common/ex_wrapper.dart';

class ExampleSvgaplayerPage extends StatelessWidget {
  final samples = const <String>[
    "assets/angel.svga",
    "assets/pin_jump.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/EmptyState.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/HamburgerArrow.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/PinJump.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/TwitterHeart.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/Walkthrough.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/kingset.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/halloween.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/heartbeat.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/matteBitmap.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/matteRect.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/posche.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/rose.svga",
  ].map((e) => [e.split('/').last, e]).toList(growable: false);

  ExampleSvgaplayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SVGA')),
      body: GridView.builder(
        itemCount: samples.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (context) =>
                          ControlDetail(samples[index].last)));
            },
            child: ExampleItemWrapper(
              child: SNSvgaplayerWrapper(
                imageUrl: samples[index].last,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ControlDetail extends StatefulWidget {
  final String imageUrl;

  const ControlDetail(this.imageUrl, {Key? key}) : super(key: key);

  @override
  _ControlDetailState createState() => _ControlDetailState();
}

class _ControlDetailState extends State<ControlDetail>
    with TickerProviderStateMixin {
  late final _controller = SVGAAnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.imageUrl),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: SNSvgaplayerWrapper(
                imageUrl: widget.imageUrl,
                controller: _controller,
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
