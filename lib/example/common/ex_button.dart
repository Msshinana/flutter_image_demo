import 'package:flutter/material.dart';

class ExampleButtonNode extends StatelessWidget {
  const ExampleButtonNode({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.black12)),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            )));
  }
}

class ButtonItemNode extends StatelessWidget {
  const ButtonItemNode({
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,
      margin: const EdgeInsets.only(
        top: 10.0,
        bottom: 20.0,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
