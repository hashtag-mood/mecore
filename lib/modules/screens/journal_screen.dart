import 'package:flutter/material.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/widgets/appbar/journal_screen_appbar.dart';
import 'package:mecore/widgets/body/journal_screen_body.dart';

class JournalScreen extends StatelessWidget {
  final String? recordPath;
  final String? searchPath;

  const JournalScreen({super.key, this.recordPath, this.searchPath});

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
            flexibleSpace: JournalScreenAppbar(),
          ),
        ),
        body: JournalScreenBody(),
      ),
    );
  }
}
