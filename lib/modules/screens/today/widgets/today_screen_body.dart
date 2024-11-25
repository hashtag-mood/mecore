import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:lindi_sticker_widget/lindi_sticker_icon.dart';
import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/screens/today/widgets/half_hour_color_cells_widget.dart';
import 'package:mecore/modules/screens/today/widgets/music_widget.dart';
import 'package:mecore/utils/hour_text.dart';
import 'package:mecore/modules/screens/today/widgets/animated_emoji_widget.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_sticker_button.dart';

class TodayScreenBody extends StatefulWidget {
  const TodayScreenBody({super.key});

  @override
  State<TodayScreenBody> createState() => _TodayScreenBodyState();
}

class _TodayScreenBodyState extends State<TodayScreenBody> {
  @override
  Widget build(BuildContext context) {
    return LindiStickerWidget(
      controller: AppbarStickerButton.lindiController,
      child: ClipRect(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  (AppbarStickerButton.pickConnectionState ==
                              ConnectionState.waiting ||
                          AppbarStickerButton.createConnectionState ==
                              ConnectionState.waiting ||
                          AppbarStickerButton.deleteConnectionState ==
                              ConnectionState.waiting)
                      ? Align(
                          alignment: Alignment.center,
                          child: CupertinoActivityIndicator(
                            radius: 20,
                          ))
                      : SizedBox.shrink(),
                ],
              ),
              Row(
                children: [
                  AnimatedEmojiWidget(),
                  MusicWidget(),
                ],
              ),
              Container(
                width: screenWidth(context),
                height: appbarLength(context) * 1.5,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border(bottom: mainBorderSide),
                ),
                child: CupertinoTextField.borderless(
                  padding: EdgeInsets.only(left: 8),
                  style:
                      TextStyle(color: blackColor, fontSize: 19, height: 1.5),
                  placeholder: 'COMMENT',
                  placeholderStyle: TextStyle(
                    fontSize: 19,
                    color: textSilverColor,
                  ),
                  minLines: 1,
                  maxLines: 2,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                ),
              ),
              // Container(
              //   width: screenWidth(context),
              //   height: appbarLength(context),
              //   decoration: BoxDecoration(
              //     color: backgroundColor,
              //     border: Border(bottom: mainBorderSide),
              //   ),
              //   child: CupertinoTextField.borderless(
              //     padding: EdgeInsets.only(left: 8),
              //     style: TextStyle(color: blackColor, fontSize: 19),
              //     placeholder: 'COMMENT',
              //     placeholderStyle: TextStyle(
              //       fontSize: 19,
              //       color: textSilverColor,
              //     ),
              //     minLines: 1,
              //     maxLines: 2,
              //     textAlignVertical: TextAlignVertical.center,
              //     textAlign: TextAlign.left,
              //   ),
              // ),
              SizedBox(
                height: appbarLength(context),
                child: CupertinoPicker(
                  itemExtent: 30,
                  onSelectedItemChanged: (value) {},
                  children: [
                    Text('MORNING'),
                    Text('AFTERNOON'),
                    Text('EVENING'),
                    Text('NIGHT'),
                  ],
                ),
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            width: screenWidth(context),
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                            ),
                          );
                        },
                      );
                    },
                    child: Text('sdfasdf')),
              ),
              Row(
                children: [
                  Column(
                    children: List.generate(
                      24,
                      (index) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: appbarLength(context) * 1.6,
                            width: appbarLength(context) * 4 / 3,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              border: Border(
                                right: mainBorderSide,
                                bottom: (index == 23)
                                    ? BorderSide.none
                                    : mainBorderSide,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                hourText(index),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Public Sans',
                                  letterSpacing: 2,
                                  fontVariations: [
                                    FontVariation('wght', 300),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  HalfHourColorCellsWidget(),
                  Column(
                    children: List.generate(
                      48,
                      (index) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: appbarLength(context) * 1.6 * 1 / 2,
                            width: appbarLength(context) * 5,
                            // screenWidth(context) - appbarLength(context) * 1.65,
                            child: CupertinoTextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 19,
                              ),
                              maxLines: 1,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                border: Border(
                                  bottom: index == 47
                                      ? BorderSide.none
                                      : mainBorderSide,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
