import 'package:flutter/material.dart';
import 'package:mecore/modules/screens/today/today_screen.dart';

double appbarLength(BuildContext context) {
  return MediaQuery.of(context).size.width / 7;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double todayScreenTimeWidgetHeight(BuildContext context) {
  return (screenHeight(context) - TodayScreen.todayScreenPadding - appbarLength(context) * 6 - 2) / 6;
}

double todayScreenBodyHeight(BuildContext context) {
  return screenHeight(context) - TodayScreen.todayScreenPadding - appbarLength(context) * 2 - 2;
}

double musicContainerHeight(BuildContext context) {
  return (appbarLength(context) * 2) - (appbarLength(context) * 5 / 7);
}

double drawerWidth(BuildContext context) {
  return appbarLength(context) * 5;
}

double halfHourColorCellHeight(BuildContext context) {
  return appbarLength(context) * 1.6 * 1 / 2;
}

double textFontSize = 19;

double navigationIconSize = 23;