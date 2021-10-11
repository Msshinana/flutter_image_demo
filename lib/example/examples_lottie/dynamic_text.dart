import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExampleLottieDynamicText extends StatefulWidget {
  const ExampleLottieDynamicText({Key? key}) : super(key: key);

  @override
  _ExampleLottieDynamicTextState createState() =>
      _ExampleLottieDynamicTextState();
}

class _ExampleLottieDynamicTextState extends State<ExampleLottieDynamicText>
    with TickerProviderStateMixin {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(text: /*'🔥Fire🔥'*/ 'Fire');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Dynamic text'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 300,
                child: Lottie.asset(
                  'assets/Tests/DynamicText.json',
                  delegates: LottieDelegates(
                    text: (animationText) => _textController.text,
                    textStyle: (font) => TextStyle(
                        fontFamily: font.fontFamily,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: CupertinoTextField(
                  controller: _textController,
                  onChanged: (newText) {
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
