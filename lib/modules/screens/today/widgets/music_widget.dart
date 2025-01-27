import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class MusicWidget extends StatelessWidget {
  static String musicText = '';
  TextEditingController textEditingController = TextEditingController();

  MusicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todayCollection = db.collection('today');
    final docRef = todayCollection.doc();
    return Container(
      width: appbarLength(context) * 6,
      height: appbarLength(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(bottom: mainBorderSide),
      ),
      child: CupertinoTextField.borderless(
        controller: textEditingController,
        onChanged: (value) async {
          MusicWidget.musicText = textEditingController.text;
          await todayDocRef.update({'musicText':MusicWidget.musicText});
        },
        padding: EdgeInsets.only(left: 8),
        style: TextStyle(color: blackColor, fontSize: 19),
        placeholder: 'MUSIC',
        placeholderStyle: TextStyle(
          fontSize: 19,
          color: textSilverColor,
        ),
        minLines: 1,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
      ),
    );
  }
}
