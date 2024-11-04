import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class AppbarMenuIconButton extends StatelessWidget {
  const AppbarMenuIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        decoration: BoxDecoration(
          border: Border(right: mainBorderSide),
        ),
        child: Builder(builder: (context) {
          return IconButton(
            highlightColor: Colors.transparent,
            alignment: Alignment.center,
            onPressed: () {},
            icon: Icon(CupertinoIcons.grid),
            iconSize: appbarLength(context) * 0.55,
          );
        }),
      ),
    );
  }
}
