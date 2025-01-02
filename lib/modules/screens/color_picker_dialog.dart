
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/themes/color_picker_theme_data.dart';
import '../../constants/colors.dart';
import '../../constants/lengths.dart';
import '../../constants/widgets.dart';
import '../bloc/half_hour_color_cells_cubit.dart';

Future<Color?> colorPickerDialog(BuildContext context, Color? selectedColor) async{
  return showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
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
                        context.pop(everyColors()[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: everyColors()[index],
                          border: Border.all(
                              color: blackColor,
                              width: 1),
                        ),
                        child: (selectedColor ==
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
                      context.pop(backgroundColor);
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
                          color: blackColor,
                      ),
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
}