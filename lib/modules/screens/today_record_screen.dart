import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/modules/models/date.dart';
import 'package:mecore/widgets/appbar/record_screen_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayRecordScreen extends StatefulWidget {
  const TodayRecordScreen({super.key});

  @override
  State<TodayRecordScreen> createState() => _TodayRecordScreenState();
}

class _TodayRecordScreenState extends State<TodayRecordScreen> {
  DateTime? _selectedDay;
  static Map<String, List<String>> dayOfWeek = {
    'en': ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
    'ko': ['일', '월', '화', '수', '목', '금', '토'],
    'ja': ['日', '月', '火', '水', '木', '金', '土'],
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            appbarLength(context),
          ),
          child: RecordScreenAppBar(),
        ),
        body: BlocBuilder<DateCubit, Date>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: backgroundColor),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: mainBorderSide),
                      ),
                      width: screenWidth(context),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: List.generate(
                          7,
                          (index) {
                            return SizedBox(
                              height: appbarLength(context) * 4 / 5,
                              width: (screenWidth(context) - 8) / 7,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  (Localizations.localeOf(context).languageCode ==
                                          'en')
                                      ? dayOfWeek['en']![index]
                                      : (Localizations.localeOf(context)
                                                  .languageCode ==
                                              'ko')
                                          ? dayOfWeek['ko']![index]
                                          : (Localizations.localeOf(context)
                                                      .languageCode ==
                                                  'ja')
                                              ? dayOfWeek['ja']![index]
                                              : dayOfWeek['en']![index],
                                  style: (Localizations.localeOf(context)
                                                  .languageCode ==
                                              'en' ||
                                          Localizations.localeOf(context)
                                                  .languageCode ==
                                              'ja')
                                      ? TextStyle(
                                          color: blackColor,
                                          fontSize: 20,
                                          fontFamily: 'Pretendard JP',
                                          fontVariations: [
                                            FontVariation('wght', 400),
                                          ],
                                        )
                                      : (Localizations.localeOf(context)
                                                  .languageCode ==
                                              'ko')
                                          ? TextStyle(
                                              color: blackColor,
                                              fontSize: 20,
                                            )
                                          : TextStyle(
                                              color: blackColor,
                                              fontSize: 20,
                                              fontFamily: 'Pretendard JP',
                                              fontVariations: [
                                                FontVariation('wght', 400),
                                              ],
                                            ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth(context),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border(bottom: mainBorderSide),
                      ),
                      child: TableCalendar(
                        rowHeight: appbarLength(context),
                        focusedDay: state.dateTime,
                        onPageChanged: (focusedDay) {
                          context.read<DateCubit>().updateYear(focusedDay.year);
                          context.read<DateCubit>().updateMonth(focusedDay.month);
                        },
                        firstDay: DateTime(1900, 1),
                        lastDay: DateTime(2100, 12, 31),
                        headerVisible: false,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            state.dateTime = focusedDay;
                          });
                        },
                        locale: Localizations.localeOf(context).toString(),
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, day, events) {},
                        ),
                        calendarStyle: CalendarStyle(
                          rowDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          todayDecoration: BoxDecoration(
                            borderRadius: BorderRadius.zero,
                            shape: BoxShape.rectangle,
                            color: colorPickerColors[0]['standard pink'],
                            border: Border.all(color: blackColor, width: 1),
                          ),
                          defaultTextStyle: TextStyle(
                            color: blackColor,
                            fontFamily: 'Public Sans',
                            fontVariations: [
                              FontVariation('wght', 200),
                            ],
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                          weekendTextStyle: TextStyle(
                            color: blackColor,
                            fontFamily: 'Public Sans',
                            fontVariations: [
                              FontVariation('wght', 200),
                            ],
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                          todayTextStyle: TextStyle(
                            color: blackColor,
                            fontFamily: 'Public Sans',
                            fontVariations: [
                              FontVariation('wght', 200),
                            ],
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                          outsideTextStyle: TextStyle(
                            color: textDarkSilverColor,
                            fontFamily: 'Public Sans',
                            fontVariations: [
                              FontVariation('wght', 200),
                            ],
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                          disabledTextStyle: TextStyle(
                            color: textDarkSilverColor,
                            fontFamily: 'Public Sans',
                            fontVariations: [
                              FontVariation('wght', 200),
                            ],
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                          selectedTextStyle: TextStyle(
                            color: blackColor,
                            fontFamily: 'Public Sans',
                            fontVariations: [
                              FontVariation('wght', 200),
                            ],
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                          defaultDecoration: BoxDecoration(),
                          weekendDecoration: BoxDecoration(),
                          outsideDecoration: BoxDecoration(),
                          disabledDecoration: BoxDecoration(),
                          selectedDecoration: BoxDecoration(
                            borderRadius: BorderRadius.zero,
                            shape: BoxShape.rectangle,
                            color: colorPickerColors[1]['light silver'],
                            border: Border.all(color: blackColor, width: 1),
                          ),
                        ),
                        daysOfWeekVisible: false,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        /*
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          height: MediaQuery.of(context).size.height -
              appbarLength(context) * 2 -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          child:
              BlocBuilder<MonthYearCubit, MonthYear>(builder: (context, state) {
            return CalendarCarousel(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              minSelectedDate: DateTime(1900),
              maxSelectedDate: DateTime(2100),
              dayMainAxisAlignment: MainAxisAlignment.center,
              targetDateTime: state.dateTime,
              headerText:
                  DateFormat('MMM yyyy').format(state.dateTime).toUpperCase(),
              onCalendarChanged: (date) {
                context.read<MonthYearCubit>().updateYear(date.year);
                context.read<MonthYearCubit>().updateMonth(date.month);
              },
              showHeaderButton: false,
              daysHaveCircularBorder: false,
              headerTextStyle: TextStyle(
                  color: blackColor,
                  fontFamily: 'Unbounded SemiBold',
                  fontSize: 22),
              headerMargin: EdgeInsets.symmetric(vertical: 10),
              headerTitleTouchable: true,
              onHeaderTitlePressed: () async {
                await CupertinoMonthYearPicker().selectDate(
                  context,
                  (month) {
                    context.read<MonthYearCubit>().updateMonth(month);
                  },
                  (year) {
                    context.read<MonthYearCubit>().updateYear(year);
                  },
                );
              },
              customDayBuilder: (isSelectable,
                  index,
                  isSelectedDay,
                  isToday,
                  isPrevMonthDay,
                  textStyle,
                  isNextMonthDay,
                  isThisMonthDay,
                  day) {
                  return Align(alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: (day.weekday == DateTime.saturday &&
                                  isThisMonthDay == true) ? saturdayColor : (day.weekday == DateTime.sunday &&
                            isThisMonthDay == true) ? sundayColor : blackColor,
                        fontFamily: 'Public Sans',
                        fontVariations: [
                          FontVariation('wght', 200),
                        ],
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  );
              },
              weekDayFormat: WeekdayFormat.narrow,
              customWeekDayBuilder: (weekday, weekdayName) {
                return Container(
                  width: appbarLength(context),
                  height: appbarLength(context) * 2 / 3,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      weekdayName,
                      style: TextStyle(
                        color: (weekday == 6)
                            ? saturdayColor
                            : (weekday == 0)
                                ? sundayColor
                                : blackColor,
                        fontFamily: 'Public Sans',
                        fontVariations: [
                          FontVariation('wght', 500),
                        ],
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
              daysTextStyle: TextStyle(
                color: blackColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
              weekendTextStyle: TextStyle(
                color: blackColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
              nextDaysTextStyle: TextStyle(
                color: textDarkSilverColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
              prevDaysTextStyle: TextStyle(
                color: textDarkSilverColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
              todayTextStyle: TextStyle(
                color: backgroundColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
              inactiveDaysTextStyle: TextStyle(
                color: blackColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
              inactiveWeekendTextStyle: TextStyle(
                color: blackColor,
                fontFamily: 'Public Sans',
                fontVariations: [
                  FontVariation('wght', 200),
                ],
                fontSize: 18,
                letterSpacing: 1,
              ),
            );
          }),
        ),
         */
      ),
    );
  }
}
