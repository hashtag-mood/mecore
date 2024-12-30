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
import 'package:mecore/modules/bloc/setting_cubit.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';
import 'package:mecore/modules/screens/today/widgets/max_width.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';

class MorningScreen extends StatefulWidget {
  const MorningScreen({super.key});

  @override
  State<MorningScreen> createState() => _MorningScreenState();
}

class _MorningScreenState extends State<MorningScreen> {
  List<String> morningHour = ['5', '6', '7', '8', '9', '10'];
  int? startIndex;
  int? cellIndex;
  int? endIndex;
  bool isDragging = false;
  TextEditingController textEditingController = TextEditingController();
  Map<int, Color> draggedMorningColors = {};
  Map<int, Color> morningColors = {};

  /// draggedMorningColor 초기화
  /// 초기화 시점: picker close될때
  void clearDraggedMorningColors(){
    draggedMorningColors.clear();
  }


  ///cubit의 morinigColor값을 화면에 적용
  void updateMorningColor(Color color){
    if (startIndex != null && endIndex != null) {
      for (int i = 0; i < 12; i++) {
        if (startIndex! <= i && i <= endIndex! ||
            endIndex! <= i && i <= startIndex!) {
          morningColors[i] = color;
        }
      }
    }
  }
  ///cell color에 따라 text color  반전
  Color getCellTextColor(int index){
    if((morningColors[index]?.computeLuminance()??1) < 0.3 && (draggedMorningColors[index]?.computeLuminance()??1) < 0.3) {
      return backgroundColor;
    } else {
      return blackColor;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: List.generate(
            6,
            (index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: appbarLength(context) * 4 / 3,
                  height: todayScreenTimeWidgetHeight(context),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border(
                      right: mainBorderSide,
                      bottom: (index == 5) ? BorderSide.none : mainBorderSide,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      morningHour[index],
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
        BlocBuilder<HalfHourColorCellsCubit, HalfHourColorCells>(
          builder: (context, state) {
            double startOffset = 0;
            double cellOffset = 0;
            double endOffset = 0;

            updateMorningColor(state.morningColor);

            return Column(
              children: List.generate(
                12,
                (index) {


                  final settingState = context.watch<SettingCubit>().state;
                  Color boxBackgroundColor=backgroundColor;
                  if(draggedMorningColors[index] != null){
                    boxBackgroundColor=draggedMorningColors[index]!;
                  }else if(morningColors.containsKey(index)){
                    boxBackgroundColor=morningColors[index]!;
                  }

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: todayScreenTimeWidgetHeight(context) / 2,
                      width: appbarLength(context) * 2 / 3,
                      // appbarLength(context) * 0.65,
                      decoration: BoxDecoration(
                        color:boxBackgroundColor,
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

                            print('dragupdate cellIndex:$cellIndex # startIndex ; $startIndex');

                            //아래에서 위로 드래그
                            if(startIndex! > cellIndex!) {
                              for (var i = startIndex!; i >= cellIndex!; i--) {
                                draggedMorningColors[i]=Colors.pink.shade50;
                              }
                            }else{//위에서 아래로 드래그
                              for(var i=startIndex!; i <= cellIndex!; i++){
                                draggedMorningColors[i]=Colors.pink.shade50;
                              }
                            }
                            setState(() {

                            });


                          //setState(() {
                            // isDragging = true;
                            // if (startIndex != null && cellIndex != null) {
                            //   for (int i = 0; i < 12; i++) {
                            //     if ((startIndex! <= i && cellIndex! >=i ) ||
                            //         (startIndex! >= i && cellIndex! <=i)) {
                            //
                            //       morningColors[i] = Colors.pink.shade50;
                            //     }
                            //   }
                            // }
                          //});
                        },
                        onVerticalDragEnd: (details) async {
                          endOffset = details.localPosition.dy;
                          endIndex = startIndex! +
                              ((endOffset - startOffset) /
                                      (todayScreenTimeWidgetHeight(context) /
                                          2))
                                  .round();
                          // if (isDragging = false) {
                          //   if (startIndex != null && endIndex != null) {
                          //     for (int i = 0; i < 12; i++) {
                          //       if (startIndex! <= i && i <= endIndex! ||
                          //           endIndex! <= i && i <= startIndex!) {
                          //         morningColors[i] = state.morningColor;
                          //       }
                          //     }
                          //   }
                          // }
                          draggedMorningColors.clear();
                          return showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              final dialogState = context
                                  .watch<HalfHourColorCellsCubit>()
                                  .state;
                              return AlertDialog(
                                shape: Border.all(width: 1, color: blackColor),
                                backgroundColor: backgroundColor,
                                actionsPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.all(15),
                                title: null,
                                content: SizedBox(
                                  width: 175,
                                  height: 300,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      width: screenWidth(context),
                                      height: 300,
                                      child: GridView.builder(
                                        physics: ClampingScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 8,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 8,
                                        ),
                                        itemCount: everyColors().length,
                                        itemBuilder: (context, index) {
                                          return AspectRatio(
                                            aspectRatio: 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<
                                                        HalfHourColorCellsCubit>()
                                                    .selectMorningColor(
                                                        color: everyColors()[
                                                            index]);
                                                // context
                                                //     .read<HalfHourColorCellsCubit>()
                                                //     .selectColor(
                                                //     color:
                                                //     everyColors()[index]);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: everyColors()[index],
                                                  border: Border.all(
                                                      color: blackColor,
                                                      width: 1),
                                                ),
                                                child: (dialogState
                                                            .morningColor ==
                                                        everyColors()[index])
                                                    // (dialogState.selectedColor ==
                                                    //     everyColors()[index])
                                                    ? Icon(CupertinoIcons
                                                        .checkmark)
                                                    : null,
                                                // (dialogState.selectedColor == everyColors()[index]) ? Icon(
                                                //     CupertinoIcons
                                                //         .checkmark) : null,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                actionsAlignment: MainAxisAlignment.spaceEvenly,
                                actions: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      border: Border(top: mainBorderSide),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 160,
                                          height: appbarLength(context),
                                          decoration: BoxDecoration(
                                            border:
                                                Border(right: mainBorderSide),
                                          ),
                                          child: CupertinoButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      HalfHourColorCellsCubit>()
                                                  .selectMorningColor(
                                                      color: backgroundColor);
                                              // context
                                              //     .read<HalfHourColorCellsCubit>()
                                              //     .selectColor(
                                              //     color: backgroundColor);
                                            },
                                            child: Text(
                                              'RESET',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Unbounded Medium',
                                                  fontSize: 19,
                                                  color: blackColor),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160,
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
                                                  fontSize: 19,
                                                  color: blackColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: (settingState.showMinute)
                            ? (index.isEven)
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '00',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: getCellTextColor(index),
                                    ),
                                  ))
                                : Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: getCellTextColor(index),
                                    ),
                                  ))
                            : null,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
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
                ],
                scrollPhysics: NeverScrollableScrollPhysics(),
                maxLines: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
