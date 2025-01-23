import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/bloc/half_hour_text_field_cubit.dart';
import 'package:mecore/modules/bloc/setting_cubit.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';
import 'package:mecore/modules/screens/today/widgets/max_width.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';

import '../../color_picker_dialog.dart';

class MorningScreen extends StatefulWidget {
  const MorningScreen({super.key});

  @override
  State<MorningScreen> createState() => _MorningScreenState();
}

class _MorningScreenState extends State<MorningScreen> {
  List<String> morningHour = ['5', '6', '7', '8', '9', '10'];

  List<String> cellHour() {
    List<String> cellHourList = [];
    for (String element in morningHour) {
      cellHourList.add(element);
      cellHourList.add(element);
    }
    return cellHourList;
  }

  int? startIndex;
  int? cellIndex;
  int? endIndex;
  List<TextEditingController> textEditingControllerList = List.generate(
    12,
    (_) => TextEditingController(),
  );

  TextEditingController textEditingController = TextEditingController();
  Map<int, Color> draggedMorningColors = {};
  Map<int, Color> morningColors = {};

  ///color picker가 close될 때 draggedMorningColors 초기화
  void clearDraggedColor() {
    draggedMorningColors.clear();
  }

  ///cell color에 따라 text color 반전
  Color getTextColor(int index) {
    if (draggedMorningColors[index] != null) {
      if (draggedMorningColors[index]!.computeLuminance() < 0.3) {
        return backgroundColor;
      } else {
        return blackColor;
      }
    }

    if ((morningColors[index]?.computeLuminance() ?? 1) < 0.3) {
      return backgroundColor;
    } else {
      return blackColor;
    }
  }

  ///color picker에서 선택된 color인 morning color를 화면에 적용
  void updateMorningColor(Color color) {
    if (startIndex != null && endIndex != null) {
      for (int i = 0; i < 12; i++) {
        if (startIndex! <= i && i <= endIndex! ||
            endIndex! <= i && i <= startIndex!) {
          morningColors[i] = color;
        }
      }
    }
  }

  //todo: resetMorningColor와 updateMorningColor의 for문 규칙을 동일하게 하면 좋겠음.

  /// reset 버튼을 누르면 선택된 영역의 morning color 삭제
  void resetMorningColor() {
    //아래에서 위로 드래그
    if (startIndex! > cellIndex!) {
      for (var i = startIndex!; i >= cellIndex!; i--) {
        morningColors.remove(i);
      }
    } else {
      //위에서 아래로 드래그
      for (var i = startIndex!; i <= cellIndex!; i++) {
        morningColors.remove(i);
      }
    }
  }

  /// 선택된 영역의 color가 두 개 이상이면 null을, 단일 color면 해당 color를 return
  Color? getSelectedColor() {
    //List<Color> returnColors=[];
    Set returnColorsSet = {};

    if (startIndex != null && endIndex != null) {
      for (int i = 0; i < 12; i++) {
        if (startIndex! <= i && i <= endIndex! ||
            endIndex! <= i && i <= startIndex!) {
          if (morningColors[i] == null) continue;
          returnColorsSet.add(morningColors[i]!);
          //returnColors.add(morningColors[i]!);
        }
      }
    }

    if (returnColorsSet.length > 1 || returnColorsSet.isEmpty) {
      return null;
    } else {
      return returnColorsSet.first;
      //return returnColors[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    double startOffset = 0;
    double cellOffset = 0;
    double endOffset = 0;

    return Column(
      children: [
        Row(
          children: [
            hourTextCells(context, morningHour),
            /*
            Column(
              children: List.generate(12, (index) {
                final settingState = context.watch<SettingCubit>().state;
                return Container(
                  width: appbarLength(context) * 2 / 3,
                  height: context
                      .read<HalfHourTextFieldCubit>()
                      .state
                      .textFieldHeightList[index],
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: (context
                        .read<HalfHourTextFieldCubit>()
                        .state.additionalHeight == 0) ? Border(
                      bottom: (index == 11) ? BorderSide.none : mainBorderSide,
                      right: mainBorderSide,
                    ) : Border(right: mainBorderSide, bottom: (index == 11) ? BorderSide.none : mainBorderSide,),
                  ),
                  child: (settingState.showMinute)
                      ? (index.isEven)
                      ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      '00',
                      style: TextStyle(
                        fontSize: 15,
                        color: getTextColor(index),
                      ),
                    ),
                  )
                      : Align(
                    alignment: Alignment.center,
                    child: Text(
                      '30',
                      style: TextStyle(
                        fontSize: 15,
                        color: getTextColor(index),
                      ),
                    ),
                  )
                      : null,
                );
              },),
            ),
            */
            Column(
              children: List.generate(
                12,
                (index) {
                  final settingState = context.watch<SettingCubit>().state;
                  return Column(
                    children: [
                      Container(
                        width: appbarLength(context) * 2 / 3,
                        height: todayScreenTimeWidgetHeight(context) / 2,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: (context
                      .read<HalfHourTextFieldCubit>()
                      .state.additionalHeight == 0) ? Border(
                            bottom: (index == 11) ? BorderSide.none : mainBorderSide,
                            right: mainBorderSide,
                          ) : Border(right: mainBorderSide, bottom: (index == 11) ? BorderSide.none : mainBorderSide,),
                        ),
                        child: (settingState.showMinute)
                            ? (index.isEven)
                            ? Align(
                          alignment: Alignment.center,
                          child: Text(
                            '00',
                            style: TextStyle(
                              fontSize: 15,
                              color: getTextColor(index),
                            ),
                          ),
                        )
                            : Align(
                          alignment: Alignment.center,
                          child: Text(
                            '30',
                            style: TextStyle(
                              fontSize: 15,
                              color: getTextColor(index),
                            ),
                          ),
                        )
                            : null,
                      ),
                      Container(
                        width: appbarLength(context) * 2 / 3,
                        height: context
                                .read<HalfHourTextFieldCubit>()
                                .state
                                .textFieldHeightList[index] -
                            todayScreenTimeWidgetHeight(context) / 2,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: (context
                              .read<HalfHourTextFieldCubit>()
                      .state.additionalHeight != 0) ? Border(
                            bottom: (index == 11) ? BorderSide.none : mainBorderSide,
                            right: mainBorderSide,
                          ) : null,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            /*
            Column(
              children: List.generate(
                12,
                (index) {
                  final settingState = context.watch<SettingCubit>().state;
                  Color boxBackgroundColor = backgroundColor;
                  if (draggedMorningColors[index] != null) {
                    boxBackgroundColor = draggedMorningColors[index]!;
                  } else if (morningColors.containsKey(index)) {
                    boxBackgroundColor = morningColors[index]!;
                  }

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: todayScreenTimeWidgetHeight(context) / 2,
                      width: appbarLength(context) * 2 / 3,
                      // appbarLength(context) * 0.65,
                      decoration: BoxDecoration(
                        color: boxBackgroundColor,
                        // color: (morningColors.containsKey(index))
                        //     ? morningColors[index]
                        //     : backgroundColor,
                        border: Border(
                          right: mainBorderSide,
                          bottom:
                              index == 11 ? BorderSide.none : mainBorderSide,
                        ),
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onVerticalDragStart: (details) {
                          startIndex = index;
                          startOffset = details.localPosition.dy;
                        },
                        onVerticalDragUpdate: (details) {
                          cellOffset = details.localPosition.dy;
                          cellIndex = startIndex! +
                              ((cellOffset - startOffset) /
                                      (todayScreenTimeWidgetHeight(context) /
                                          2))
                                  .round();

                          // print(
                          //     'dragupdate cellIndex:$cellIndex # startIndex ; $startIndex');

                          //아래에서 위로 드래그
                          if (startIndex! > cellIndex!) {
                            for (var i = startIndex!; i >= cellIndex!; i--) {
                              draggedMorningColors[i] = Colors.pink.shade50;
                            }
                          } else {
                            //위에서 아래로 드래그
                            for (var i = startIndex!; i <= cellIndex!; i++) {
                              draggedMorningColors[i] = Colors.pink.shade50;
                            }
                          }
                          setState(() {});
                        },
                        onVerticalDragEnd: (details) async {
                          endOffset = details.localPosition.dy;
                          endIndex = startIndex! +
                              ((endOffset - startOffset) /
                                      (todayScreenTimeWidgetHeight(context) /
                                          2))
                                  .round();

                          colorPickerDialog(context, getSelectedColor())
                              .then((color) {
                            draggedMorningColors.clear();
                            //dialog에서 reset이 눌린경우, 또는 color 선택없이 dialog close한 경우

                            //colorPicker 가 close됨
                            if (color == null) {
                            } else if (color == backgroundColor) {
                              //colorPicker dialog reset
                              resetMorningColor();
                            } else {
                              updateMorningColor(color);
                            }
                            setState(() {});
                          });
                        },
                        child: (settingState.showMinute)
                            ? (index.isEven)
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '00',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: getTextColor(index),
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: getTextColor(index),
                                      ),
                                    ),
                                  )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            */
            halfHourTextField(
              context: context,
              textEditingControllerList: textEditingControllerList,
            ),
            //todayTextField(context, textEditingController),
            /*
            Stack(
              children: [
                Column(
                  children: List.generate(
                    12,
                    (index) {
                      return Container(
                        width: appbarLength(context) * 5,
                        height: todayScreenTimeWidgetHeight(context) / 2,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border(
                            bottom: index == 11 ? BorderSide.none : mainBorderSide,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: appbarLength(context) * 5,
                  height: todayScreenTimeWidgetHeight(context) * 6,
                  child: CupertinoTextField.borderless(
                    controller: textEditingController,
                    padding: EdgeInsets.only(left: 8),
                    cursorHeight: fontSize,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: fontSize,
                      height: todayScreenTimeWidgetHeight(context) / 2 / fontSize,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          int lines = newValue.text.split('\n').length;
                          if (lines > 12) {
                            return oldValue;
                          } else {
                            return newValue;
                          }
                        },
                      ),
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          final textSpan = TextSpan(
                            text: newValue.text,
                            style: TextStyle(
                              fontSize: fontSize,
                              height: todayScreenTimeWidgetHeight(context) /
                                  2 /
                                  fontSize,
                              leadingDistribution: TextLeadingDistribution.even,
                            ),
                          );
                          final textPainter = TextPainter(
                              text: textSpan, textDirection: TextDirection.ltr);
                          textPainter.layout(
                              maxWidth: appbarLength(context) * 5 - 8);
                          if (textPainter.size.width ==
                                  appbarLength(context) * 5 - 8 &&
                              textPainter.size.height >
                                  todayScreenTimeWidgetHeight(context) * 6 + 2) {
                            textEditingController.text = oldValue.text;
                            textEditingController.selection = TextSelection.collapsed(
                              offset: textEditingController.text.length,
                            );
                            return oldValue;
                          } else {
                            return newValue;
                          }
                        },
                      ),
                    ],
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    maxLines: 12,
                  ),
                ),
              ],
            ),
            */
          ],
        ),
      ],
    );
  }
}
