import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class SettingCustomWidget extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final Border? border;
  final Widget child;
  const SettingCustomWidget({super.key, required this.buttonWidth, required this.buttonHeight, required this.border, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
      ),
      child: child,
    );
  }
}
