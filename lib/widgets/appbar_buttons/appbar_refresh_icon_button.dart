import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';

class AppbarRefreshIconButton extends StatelessWidget {
  final VoidCallback onPressedCallback;

  const AppbarRefreshIconButton({super.key, required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        child: IconButton(
          highlightColor: Colors.transparent,
          alignment: Alignment.center,
          onPressed: onPressedCallback,
          icon: Icon(
            CupertinoIcons.arrow_2_circlepath,
            color: blackColor,
          ),
          iconSize: appbarLength(context) * 0.55,
        ),
      ),
    );
  }
}
