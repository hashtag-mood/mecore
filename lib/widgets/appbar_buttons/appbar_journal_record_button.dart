import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class AppbarJournalRecordButton extends StatelessWidget {
  const AppbarJournalRecordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        decoration: BoxDecoration(
          border: Border(right: mainBorderSide),
        ),
        child: Builder(
          builder: (context) {
            return IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
                context.go('/journal/record');
              },
              icon: Icon(CupertinoIcons.folder),
              iconSize: appbarLength(context) * 0.5,
              // icon: Image.asset(
              //   'assets/icons/medical-star_48.png',
              //   width: appbarLength(context) * 0.45,
              // ),
            );
          },
        ),
      ),
    );
  }
}
