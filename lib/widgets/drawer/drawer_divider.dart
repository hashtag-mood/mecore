import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';

class DrawerDivider extends StatelessWidget {
  final Border border;
  const DrawerDivider({super.key, required this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appbarLength(context) * 0.25,
      decoration: BoxDecoration(
        border: border,
        color: drawerDividerColor,
      ),
    );
  }
}
