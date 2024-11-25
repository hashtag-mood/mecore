import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/modules/models/date.dart';
import 'package:mecore/widgets/picker/custom_cupertino_picker.dart';

CustomCupertinoDatePicker customCupertinoDatePicker =
    CustomCupertinoDatePicker();

class CustomCupertinoDatePicker {
  // int selectedMonth = DateTime.now().month;
  // int selectedDay = DateTime.now().day;
  // int selectedYear = DateTime.now().year;

  // List<int> monthIndex = List.generate(
  //     12,
  //     (index) => 1 + index,
  //   );

  // List<int> dayIndex = List.generate(
  //     31,
  //     (index) => 1 + index,
  //   );

  // int yearIndex = DateTime.now().year - 1900;

  Future<void> selectDate(BuildContext context, Function(int) onMonthChanged,
      Function(int) onDayChanged, Function(int) onYearChanged) async {
    await showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BlocBuilder<DateCubit, Date>(builder: (context, state) {
          int selectedMonth = state.dateTime.month;
          int selectedYear = state.dateTime.year;
          int selectedDay = state.dateTime.day;
          int yearIndex = selectedYear - 1900;
          FixedExtentScrollController yearController =
              FixedExtentScrollController(initialItem: yearIndex);
          FixedExtentScrollController monthController =
              FixedExtentScrollController(initialItem: selectedMonth - 1);
          FixedExtentScrollController dayController =
              FixedExtentScrollController(initialItem: selectedDay - 1);
          return Center(
            child: Container(
              width: appbarLength(context) * 5.5 + 2,
              height: appbarLength(context) * 5 + 2,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: blackColor),
                color: backgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: appbarLength(context) * 1.5,
                        height: appbarLength(context) * 4,
                        child: CustomCupertinoPicker(
                          // month
                          itemExtent: appbarLength(context),
                          controller: monthController,
                          onChangedCallback: (int index) {
                            selectedMonth = index + 1;
                            context
                                .read<DateCubit>()
                                .updateMonth(selectedMonth);
                          },
                          dateTimeList: List.generate(
                            12,
                            (index) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontFamily: 'Unbounded SemiBold',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: appbarLength(context) * 1.5,
                        height: appbarLength(context) * 4,
                        child: CustomCupertinoPicker(
                          // day
                          itemExtent: appbarLength(context),
                          controller: dayController,
                          onChangedCallback: (int index) {
                            selectedDay = index + 1;
                            context.read<DateCubit>().updateDay(selectedDay);
                          },
                          dateTimeList: List.generate(
                            31,
                            (index) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontFamily: 'Unbounded SemiBold',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: appbarLength(context) * 2.5,
                        height: appbarLength(context) * 4,
                        child: CustomCupertinoPicker(
                          // year
                          itemExtent: appbarLength(context),
                          controller: yearController,
                          onChangedCallback: (int index) {
                            selectedYear = 1900 + index;
                            context
                                .read<DateCubit>()
                                .updateYear(selectedYear);
                          },
                          dateTimeList: List.generate(
                            201,
                            (index) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${1900 + index}',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontFamily: 'Unbounded SemiBold',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: appbarLength(context),
                    decoration: BoxDecoration(
                      border: Border(
                        top: mainBorderSide,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: appbarLength(context) * 2.75,
                          height: appbarLength(context),
                          decoration: BoxDecoration(
                            border: Border(right: mainBorderSide),
                          ),
                          child: CupertinoButton(
                            child: Text(
                              'TODAY',
                              style: TextStyle(
                                  fontFamily:
                                  'Unbounded Medium',
                                  fontSize: 19,
                                  color: blackColor),
                            ),
                            onPressed: () {
                              context
                                  .read<DateCubit>()
                                  .updateYear(DateTime.now().year);
                              context
                                  .read<DateCubit>()
                                  .updateMonth(DateTime.now().month);
                              context.read<DateCubit>().updateDay(DateTime.now().day);
                              yearController
                                  .jumpToItem(DateTime.now().year - 1900);
                              monthController
                                  .jumpToItem(DateTime.now().month - 1);
                              dayController.jumpToItem(DateTime.now().day - 1);
                            },
                          ),
                        ),
                        Container(
                          width: appbarLength(context) * 2.75,
                          height: appbarLength(context),
                          child: CupertinoButton(
                            child: Text(
                              'DONE',
                              style: TextStyle(
                                  fontFamily:
                                  'Unbounded Medium',
                                  fontSize: 19,
                                  color: blackColor),
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
