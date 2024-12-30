import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';

class JournalScreenBody extends StatefulWidget {
  const JournalScreenBody({super.key});

  @override
  State<JournalScreenBody> createState() => _JournalScreenBodyState();
}

class _JournalScreenBodyState extends State<JournalScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: ResponsiveNotebookBackground(
        options: ResponsiveNotebookBackgroundOptions(
          styleForHeightCalculation: TextStyle(
            height: 2.5,
            fontSize: 20,
            color: blackColor,
            leadingDistribution: TextLeadingDistribution.even,
          ),
          backgroundColor: backgroundColor,
          lineColor: blackColor,
        ),
        child: CupertinoTextField.borderless(
          minLines: 20,
          maxLines: null,
          padding: EdgeInsets.only(left: 8),
          cursorHeight: 20,
          scrollPadding: EdgeInsets.zero,
          style: TextStyle(
            height: 2.5,
            fontSize: 20,
            color: blackColor,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }
}