import 'package:flutter/material.dart';

class MaxWidth extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final double maxWidth;
  final double height;
  final Widget Function(BuildContext context, double height) builder;
  const MaxWidth({super.key, this.text, this.textStyle, this.maxWidth = double.infinity, required this.height, required this.builder});

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return builder(context, height);
  }
}
