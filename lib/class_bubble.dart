import 'package:flutter/material.dart';

class BubbleData {
  final String text;
  final double fontSize;

  BubbleData(this.text, this.fontSize);
}

class BubbleWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const BubbleWidget({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}

