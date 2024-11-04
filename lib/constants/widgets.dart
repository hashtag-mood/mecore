import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';

/// color: black, width: 1
final mainBorderSide = BorderSide(
  color: blackColor,
  width: 1,
);

/// fontFamily: Unbounded SemiBold, fontSize: appbarLength(context) * 0.38, color: black
TextStyle dateTextStyle(BuildContext context) {
  return TextStyle(
      fontFamily: 'Unbounded SemiBold',
      fontSize: appbarLength(context) * 0.38,
      color: blackColor);
}