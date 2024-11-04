import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

CustomYearPicker customYearPicker = CustomYearPicker();

class CustomYearPicker {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  int currentYearIndex = DateTime.now().year - 1900;

  void selectDate(BuildContext context, Function(int) onYearChanged) {
    showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: appbarLength(context) * 5.5,
            height: appbarLength(context) * 5 + 2,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: blackColor),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: appbarLength(context) * 4,
                  child: CupertinoPicker(
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.symmetric(horizontal: mainBorderSide),
                      ),
                    ),
                    backgroundColor: backgroundColor,
                    scrollController:
                        FixedExtentScrollController(initialItem: currentYearIndex),
                    itemExtent: appbarLength(context),
                    onSelectedItemChanged: (int index) {
                      selectedYear = 1900 + index;
                      onYearChanged(selectedYear);
                    },
                    children: List.generate(
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
                Container(
                  width: appbarLength(context) * 5.5,
                  height: appbarLength(context),
                  decoration: BoxDecoration(
                    border: Border(top: mainBorderSide),
                  ),
                  child: CupertinoButton(
                    color: backgroundColor,
                    borderRadius: BorderRadius.zero,
                    child: Text(
                      'DONE',
                      style: TextStyle(
                        fontFamily: 'Interop Regular',
                        color: blackColor,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
