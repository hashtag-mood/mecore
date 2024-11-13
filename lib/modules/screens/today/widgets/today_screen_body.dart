import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/bloc/single_line_text_cubit.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';
import 'package:mecore/modules/models/single_line_text.dart';
import 'package:mecore/modules/screens/today/widgets/half_hour_color_cells_widget.dart';
import 'package:mecore/modules/screens/today/widgets/single_line_text_widget.dart';
import 'package:mecore/utils/hour_text.dart';
import 'package:mecore/widgets/containers/animated_emoji_container.dart';
import 'package:text_marquee/text_marquee.dart';

class TodayScreenBody extends StatefulWidget {
  const TodayScreenBody({super.key});

  @override
  State<TodayScreenBody> createState() => _TodayScreenBodyState();
}

class _TodayScreenBodyState extends State<TodayScreenBody> {
  // TextEditingController textMarqueeEditingController = TextEditingController();
  // String completeText = '';
  TextEditingController dDayNumberEditingController = TextEditingController();
  int? dDayNumber;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: mainBorderSide),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container( // TODO handle with cubit
                        width: appbarLength(context) * 2,
                        height: appbarLength(context),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border(
                              bottom: mainBorderSide, right: mainBorderSide),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              barrierColor: Colors.transparent,
                              builder: (context) {
                                return AlertDialog(
                                  shape:
                                      Border.all(width: 1, color: blackColor),
                                  backgroundColor: backgroundColor,
                                  actionsPadding: EdgeInsets.zero,
                                  contentPadding: EdgeInsets.zero,
                                  title: null,
                                  content: SizedBox(
                                    width: 90,
                                    height: appbarLength(context),
                                    child: CupertinoTextField.borderless(
                                      controller: dDayNumberEditingController,
                                      padding: EdgeInsets.zero,
                                      style: TextStyle(
                                          fontFamily: 'Unbounded Medium',
                                          color: blackColor,
                                          fontSize: 20),
                                      placeholder: 'DAYS',
                                      placeholderStyle: TextStyle(
                                          fontFamily: 'Unbounded Medium',
                                          fontSize: 20,
                                          color: textSilverColor),
                                      minLines: 1,
                                      maxLength: 4,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        setState(() {
                                          dDayNumberEditingController.text =
                                              value;
                                        });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        border: Border(top: mainBorderSide),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 175,
                                            height: appbarLength(context),
                                            decoration: BoxDecoration(
                                              border:
                                                  Border(right: mainBorderSide),
                                            ),
                                            child: CupertinoButton(
                                              onPressed: () {
                                                setState(() {
                                                  dDayNumberEditingController
                                                      .text = '';
                                                });
                                              },
                                              child: Text(
                                                'RESET',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'Unbounded Medium',
                                                    fontSize: 20,
                                                    color: blackColor),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 175,
                                            height: appbarLength(context),
                                            child: CupertinoButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: Text(
                                                'SELECT',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'Unbounded Medium',
                                                    fontSize: 20,
                                                    color: blackColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent),
                          ),
                          child: Text(
                            (dDayNumberEditingController.text.isEmpty)
                                ? 'D–DAY'
                                : 'D–${dDayNumberEditingController.text}',
                            style: TextStyle(
                                fontFamily: 'Unbounded Medium',
                                fontSize: 20,
                                color: blackColor),
                          ),
                        ),
                      ),
                      AnimatedEmojiContainer(),
                    ],
                  ),
                  Column(
                    children: [
                      SingleLineTextWidget(),
                      Container(
                        width: appbarLength(context) * 5,
                        height: appbarLength(context) * 2,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                        ),
                        child: CupertinoTextField.borderless(
                          padding: EdgeInsets.only(left: 8),
                          style: TextStyle(
                              color: blackColor, fontSize: 19, height: 1.35),
                          placeholder: 'COMMENT',
                          placeholderStyle: TextStyle(
                            fontSize: 19,
                            color: textSilverColor,
                          ),
                          minLines: 1,
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
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
    );
  }
}
