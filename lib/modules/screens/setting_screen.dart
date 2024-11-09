import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: mainBorderSide,
                  bottom: mainBorderSide
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: appbarLength(context) * 2,
                    height: appbarLength(context) * 2,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border(
                        right: mainBorderSide
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/image/user_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenWidth(context) - appbarLength(context) * 2,
                        height: appbarLength(context),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                        ),
                        padding: EdgeInsets.only(left: 8),
                        child: Align(alignment: Alignment.centerLeft, child: Text('HYOEUN LEE', style: TextStyle(color: blackColor, fontSize: 30, fontFamily: 'Interop Bold'),)),
                      ),
                      Container(
                        width: screenWidth(context) - appbarLength(context) * 2,
                        height: appbarLength(context),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border(top: mainBorderSide),
                        ),
                        padding: EdgeInsets.only(left: 8),
                        child: Align(alignment: Alignment.centerLeft, child: Text('hashtagmood', style: TextStyle(color: blackColor, fontSize: 19),),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
