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
import 'package:mecore/modules/models/half_hour_color_cells.dart';

class HalfHourColorCellsWidget extends StatelessWidget {
  int? startIndex;
  int? endIndex;
  HalfHourColorCellsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HalfHourColorCellsCubit, HalfHourColorCells>(
      builder: (context, state) {
        double startOffset = 0;
        double endOffset = 0;
        return Column(
          children: List.generate(
            48,
            (index) {
              if (state.selectedColor != null &&
                  startIndex != null &&
                  endIndex != null) {
                for (int i = 0; i < 48; i++) {
                  if (startIndex! <= i && i <= endIndex!) {
                    selectedColors[i] = state.selectedColor!;
                  }
                }
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: halfHourColorCellHeight(context),
                  width: appbarLength(context) * 2 / 3,
                  // appbarLength(context) * 0.65,
                  decoration: BoxDecoration(
                    color: (selectedColors.containsKey(index))
                        ? selectedColors[index]
                        : backgroundColor,
                    border: Border(
                      right: mainBorderSide,
                      bottom: index == 47 ? BorderSide.none : mainBorderSide,
                    ),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onVerticalDragStart: (details) {
                      startIndex = index;
                      startOffset = details.localPosition.dy;
                    },
                    onVerticalDragEnd: (details) async {
                      endOffset = details.localPosition.dy;
                      endIndex = startIndex! +
                          ((endOffset - startOffset) /
                                  halfHourColorCellHeight(context))
                              .round();

                      return showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (context) {
                          final dialogState =
                              context.watch<HalfHourColorCellsCubit>().state;
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
                                                .selectColor(
                                                    color: everyColors()[
                                                        index]);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: everyColors()[index],
                                              border: Border.all(
                                                  color: blackColor,
                                                  width: 1),
                                            ),
                                            child: (dialogState
                                                        .selectedColor ==
                                                    everyColors()[index])
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
                                        border: Border(right: mainBorderSide),
                                      ),
                                      child: CupertinoButton(
                                        onPressed: () {
                                          context
                                              .read<HalfHourColorCellsCubit>()
                                              .selectColor(
                                                  color: backgroundColor);
                                        },
                                        child: Text(
                                          'RESET',
                                          style: TextStyle(
                                              fontFamily: 'Unbounded Medium',
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
                                              fontFamily: 'Unbounded Medium',
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
    );
  }
}

/*
 selectedIndexList.map{ (e)

 }
 */
