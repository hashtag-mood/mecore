import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/repositories/today.dart';
import 'package:mecore/modules/repositories/uid.dart';
import 'package:mecore/widgets/appbar/today_screen_appbar.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

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
    TodayScreen.todayScreenPadding = MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;
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
        body: TodayScreenBody(), // TodayScreenBody(),
      ),
    );
  }
}
