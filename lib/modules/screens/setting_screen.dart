import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/routes/routes.dart';
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
                border: Border(top: mainBorderSide, bottom: mainBorderSide),
              ),
              child: Row(
                children: [
                  Container(
                    width: appbarLength(context) * 2,
                    height: appbarLength(context) * 2,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border(right: mainBorderSide),
                    ),
                    child: Image(
                      image: AssetImage('assets/image/mecore_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenWidth(context) - appbarLength(context) * 2,
                        height: appbarLength(context) * 2 * 3 / 5,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border(bottom: mainBorderSide),
                        ),
                        padding: EdgeInsets.only(left: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '이효은 볼드 처리는 우선 하지 않았음',
                            style: TextStyle(color: blackColor, fontSize: 22),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenWidth(context) - appbarLength(context) * 2,
                        height: appbarLength(context) * 2 * 2 / 5,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                        ),
                        padding: EdgeInsets.only(left: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '상태 메세지 마키는 안 하고 스크롤만 가능하게 해두었습니다',
                            style: TextStyle(color: blackColor, fontSize: 20),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth(context),
              height: appbarLength(context),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(bottom: mainBorderSide),
              ),
              child: TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      context.go('/onboarding');
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('로그아웃'),),
            ),
          ],
        ),
      ),
    );
  }
}
