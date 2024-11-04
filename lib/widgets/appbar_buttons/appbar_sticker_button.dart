import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class AppbarStickerButton extends StatelessWidget {
  const AppbarStickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        decoration: BoxDecoration(
          border: Border(right: mainBorderSide),
        ),
        child: IconButton(
          highlightColor: Colors.transparent,
          alignment: Alignment.center,
          onPressed: () {},
          icon: Icon(CupertinoIcons.lasso),
          iconSize: appbarLength(context) * 0.55,
        ),
      ),
    );
  }
}
