import 'package:flutter/material.dart';

double appbarLength(BuildContext context) {
  return MediaQuery.of(context).size.width / 7;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double musicContainerHeight(BuildContext context) {
  return (appbarLength(context) * 2) - (appbarLength(context) * 5 / 7);
}

double drawerWidth(BuildContext context) {
  return appbarLength(context) * 5;
}