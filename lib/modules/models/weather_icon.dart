import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';

class WeatherIcon {
  final Text unselected;
  final Text selected;
  bool isSelected;

  WeatherIcon({
    required this.unselected,
    required this.selected,
    this.isSelected = false,
  });

  Text get initialText => isSelected ? selected : unselected;

  void isSwitched() {
    isSelected = !isSelected;
  }

  static TextStyle unselectedTextStyle() {
    return TextStyle(
      // fontFamily: 'Noto Color Emoji',
      // fontSize: 20,
      // foreground: Paint()..colorFilter = ColorFilter.mode(Colors.white, BlendMode.saturation),
      fontFamily: 'Noto Emoji',
      fontSize: 20,
      fontVariations: const [FontVariation('wght', 600)],
      color: textSilverColor,
    );
  }

  static TextStyle selectedTextStyle() {
    return const TextStyle(
      fontFamily: 'Noto Color Emoji',
      fontSize: 20,
    );
  }
}
