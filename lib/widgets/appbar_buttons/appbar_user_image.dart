import 'package:flutter/material.dart';
import 'package:mecore/constants/widgets.dart';

class AppbarUserImage extends StatelessWidget {
  const AppbarUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: mainBorderSide,
          ),
        ),
        child: Image.asset(
          'assets/img/user_image.jpg',
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
