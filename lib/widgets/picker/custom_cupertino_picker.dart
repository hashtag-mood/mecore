import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/widgets.dart';

class CustomCupertinoPicker extends StatelessWidget {
  final double itemExtent;
  final FixedExtentScrollController controller;
  Function(int) onChangedCallback;
  List<Widget> dateTimeList;

  CustomCupertinoPicker(
      {super.key,
      required this.itemExtent,
      required this.onChangedCallback,
      required this.controller,
      required this.dateTimeList});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      selectionOverlay: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.symmetric(horizontal: mainBorderSide),
        ),
      ),
      backgroundColor: backgroundColor,
      scrollController: controller,
      itemExtent: itemExtent,
      onSelectedItemChanged: onChangedCallback,
      children: dateTimeList,
    );
  }
}
