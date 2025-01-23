import 'package:animated_music_indicator/animated_music_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/screens/today/widgets/music_widget.dart';
import 'package:mecore/modules/screens/today/widgets/wheel_chooser_widget.dart';

class BodyHeader extends StatefulWidget {
  static String commentText = '';
  const BodyHeader({super.key});

  @override
  State<BodyHeader> createState() => _BodyHeaderState();
}

class _BodyHeaderState extends State<BodyHeader> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: appbarLength(context),
                    height: appbarLength(context),
                    decoration: BoxDecoration(
                      border: Border(bottom: mainBorderSide, right: mainBorderSide),
                      color: backgroundColor,
                    ),
                  ),
                  SizedBox(
                    width: appbarLength(context)/2.5,
                    height: appbarLength(context)/2.5,
                    child: AnimatedMusicIndicator(
                      color: blackColor,
                      numberOfBars: 3,
                      roundBars: false,
                    ),
                  )
                ],
              ),
              MusicWidget(),
            ],
          ),
          Container(
            width: screenWidth(context),
            height: appbarLength(context) * 2,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border(bottom: mainBorderSide),
            ),
            child: CupertinoTextField.borderless(
              //padding: EdgeInsets.only(left: 8),
              controller: textEditingController,
              onChanged: (value) {
                BodyHeader.commentText = textEditingController.text;
              },
              style: TextStyle(
                  color: blackColor, fontSize: 19, height: 1.5),
              placeholder: 'COMMENT',
              placeholderStyle: TextStyle(
                fontSize: 19,
                color: textSilverColor,
              ),
              minLines: 1,
              maxLines: 3,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
            ),
          ),
          WheelChooserWidget(),
        ],
      );
  }
}
