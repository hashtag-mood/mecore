import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Text(appbarLength(context).toString()),
        ),
      ),
    );
  }
}
