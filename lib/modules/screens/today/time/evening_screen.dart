import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:mecore/modules/models/setting.dart';

class EveningScreen extends StatefulWidget {
  const EveningScreen({super.key});

  @override
  State<EveningScreen> createState() => _EveningScreenState();
}

class _EveningScreenState extends State<EveningScreen> {
  List<String> evening12Hours = ['5', '6', '7', '8', '9', '10'];
  List<String> evening24Hours = ['17', '18', '19', '20', '21', '22'];
  int? startIndex;
  int? endIndex;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<SettingCubit, Setting>(
          builder: (context, state) {
            return Column(
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
                          (state.is24Hour) ? evening24Hours[index] : evening12Hours[index],
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
            );
          }
        ),
        BlocBuilder<HalfHourColorCellsCubit, HalfHourColorCells>(
          builder: (context, state) {
            double startOffset = 0;
            double endOffset = 0;
            return Column(
              children: List.generate(
                12,
                    (index) {
                  if (startIndex != null && endIndex != null) {
                    for (int i = 0; i < 12; i++) {
                      if (startIndex! <= i && i <= endIndex! ||
                          endIndex! <= i && i <= startIndex!) {
                        eveningColors[i] = state.eveningColor;
                      }
                    }
                  }
                  final settingState = context.watch<SettingCubit>().state;
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: todayScreenTimeWidgetHeight(context) / 2,
                      width: appbarLength(context) * 2 / 3,
                      // appbarLength(context) * 0.65,
                      decoration: BoxDecoration(
                        color: (eveningColors.containsKey(index))
                            ? eveningColors[index]
                            : backgroundColor,
                        border: Border(
                          right: mainBorderSide,
                          bottom:
                          index == 11 ? BorderSide.none : mainBorderSide,
                        ),
                      ),
                      child: GestureDetector(
                        child: (settingState.showMinute) ? (index.isEven)
                            ? Align(
                          alignment: Alignment.center,
                          child: Text(
                            '00',
                            style: TextStyle(
                                fontSize: 15,
                                color: (eveningColors[index] != null &&
                                    eveningColors[index]!
                                        .computeLuminance() <
                                        0.3)
                                    ? backgroundColor
                                    : blackColor),
                          ),
                        )
                            : Align(
                          alignment: Alignment.center,
                          child: Text(
                            '30',
                            style: TextStyle(
                                fontSize: 15,
                                color: (eveningColors[index] != null &&
                                    eveningColors[index]!
                                        .computeLuminance() <
                                        0.3)
                                    ? backgroundColor
                                    : blackColor),
                          ),
                        ) : null,
                        behavior: HitTestBehavior.opaque,
                        onVerticalDragStart: (details) {
                          startIndex = index;
                          startOffset = details.localPosition.dy;
                        },
                        onVerticalDragEnd: (details) async {
                          endOffset = details.localPosition.dy;
                          endIndex = startIndex! +
                              ((endOffset - startOffset) /
                                  (todayScreenTimeWidgetHeight(context) /
                                      2))
                                  .round();

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
                                                    .selectEveningColor(
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
                                                    .eveningColor ==
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
                                                  .selectEveningColor(
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
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        Column(
          children: List.generate(
            12,
                (index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: todayScreenTimeWidgetHeight(context) / 2,
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
                        bottom: index == 11 ? BorderSide.none : mainBorderSide,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
