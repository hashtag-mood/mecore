import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';

class AppbarSaveButton extends StatelessWidget {
  const AppbarSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        child: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.checkmark),
          iconSize: appbarLength(context) * 0.55,
        ),
      ),
    );
  }
}
