import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/routes/routes.dart';
import 'package:mecore/constants/lengths.dart';

class AppbarEditButton extends StatefulWidget {
  static bool isSelected = false;
  const AppbarEditButton({super.key});

  @override
  State<AppbarEditButton> createState() => _AppbarEditButtonState();
}

class _AppbarEditButtonState extends State<AppbarEditButton> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        child: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              AppbarEditButton.isSelected = !AppbarEditButton.isSelected;
            });
          },
          isSelected: AppbarEditButton.isSelected,
          //icon: Icon(CupertinoIcons.text_cursor),
          // icon: Icon(CupertinoIcons.textformat_alt),
          icon: Icon(CupertinoIcons.lock),
          selectedIcon: Icon(CupertinoIcons.checkmark),
          iconSize: appbarLength(context) * 0.55,
        ),
      ),
    );
  }
}
