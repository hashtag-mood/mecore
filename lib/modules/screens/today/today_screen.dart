import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/repositories/today.dart';
import 'package:mecore/modules/repositories/uid.dart';
import 'package:mecore/widgets/appbar/today_screen_appbar.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';
import 'package:iconify_flutter/icons/raphael.dart';
import 'package:colorful_iconify_flutter/icons/noto.dart';
import 'package:iconify_flutter/icons/game_icons.dart';



class TodayScreen extends StatefulWidget {
  final String? recordPath;
  final String? editPath;
  static double todayScreenPadding = 0;

  const TodayScreen({super.key, this.recordPath, this.editPath});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    Today.setDocRef();
    UID.setDocRef();
    TodayScreen.todayScreenPadding = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            appbarLength(context),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: TodayScreenAppbar(),
          ),
        ),
        body: TodayScreenBody(),
        floatingActionButton: GestureDetector(
          onTap: () {

          },
          child: Container(
            width: appbarLength(context),
            height: appbarLength(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              border: Border.all(),
              color: backgroundColor,
            ),
            child: Align(alignment: Alignment.center, child: Text('🎨', style: TextStyle(fontSize: 30),),),
          ),
        ),
      ),
    );
  }
}
