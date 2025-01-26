import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_text_field_cubit.dart';
import 'package:mecore/modules/models/half_hour_text_field.dart';
import 'package:mecore/utils/hour_text.dart';
import 'package:mecore/utils/new_hour_text.dart';

class NewTodayBody extends StatefulWidget {
  const NewTodayBody({super.key});

  @override
  State<NewTodayBody> createState() => _NewTodayBodyState();
}

class _NewTodayBodyState extends State<NewTodayBody> {
  List<TextEditingController> textEditingControllerList = List.generate(
    12,
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: List.generate(
                        24,
                        (index) {
                          return Container(
                            width: appbarLength(context),
                            height: todayScreenBodyHeight(context) / 12,
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
                                '5',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: List.generate(
                        48,
                        (index) {
                          return Container(
                            width: appbarLength(context) * 0.4,
                            height: todayScreenBodyHeight(context) / 24,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              border: Border(
                                right: mainBorderSide,
                                bottom: (index == 47)
                                    ? BorderSide.none
                                    : mainBorderSide,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: appbarLength(context) * 3.4,
                      height: todayScreenBodyHeight(context) * 2,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border(
                          right: mainBorderSide,
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  width: appbarLength(context) * 3.6,
                  height: todayScreenBodyHeight(context) * 2,
                  child: ClipRect(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          50,
                          (index) {
                            return Container(
                              width: appbarLength(context) * 3.6,
                              height: todayScreenBodyHeight(context) / 24,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                border: Border(
                                  bottom: (index == 47)
                                      ? BorderSide.none
                                      : mainBorderSide,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (MediaQuery.of(context).viewInsets.bottom > 0)
              Container(
                width: screenWidth(context),
                height: MediaQuery.of(context).viewInsets.bottom,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border(top: mainBorderSide),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
