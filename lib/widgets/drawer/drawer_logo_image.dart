import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class DrawerLogoImage extends StatelessWidget {
  const DrawerLogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/image/logo.png'),
        width: appbarLength(context) * 3,
      ),
      height: appbarLength(context) - 1,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: mainBorderSide),
      ),
    );
  }
}
