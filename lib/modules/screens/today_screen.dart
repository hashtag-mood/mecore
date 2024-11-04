import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/widgets/appbar/today_screen_appbar.dart';
import 'package:mecore/widgets/body/new_today_screen_body.dart';

class TodayScreen extends StatefulWidget {
  final String? recordPath;
  final String? editPath;
  final String? searchPath;
  const TodayScreen({super.key, this.recordPath, this.editPath, this.searchPath});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: NewTodayScreenBody(), // TodayScreenBody(),
      ),
    );
  }
}
