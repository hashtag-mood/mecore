import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/bloc/half_hour_text_field_cubit.dart';
import 'package:mecore/modules/models/half_hour_text_field.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

/// color: black, width: 1
final mainBorderSide = BorderSide(
  color: blackColor,
  width: 1,
);

/// fontFamily: Unbounded SemiBold, fontSize: appbarLength(context) * 0.38, color: black
TextStyle dateTextStyle(BuildContext context) {
  return TextStyle(
      fontFamily: 'Unbounded SemiBold',
      fontSize: appbarLength(context) * 0.38,
      color: blackColor);
}

Widget customCupertinoIndicator(BuildContext context) {
  return Center(
    child: Container(
      width: appbarLength(context) * 1.2,
      height: appbarLength(context) * 1.2,
      decoration: BoxDecoration(
        border: Border.all(),
        color: backgroundColor,
      ),
      child: CupertinoActivityIndicator(
        animating: true,
        color: blackColor,
        radius: 20,
      ),
    ),
  );
}

Widget hourTextCells(BuildContext context, List list) {
  return Column(
    children: List.generate(
      6,
      (index) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: appbarLength(context) * 4 / 3,
            height:
                context
                    .read<HalfHourTextFieldCubit>()
                    .state
                    .textFieldHeightList[index * 2] +
                context
                    .read<HalfHourTextFieldCubit>()
                    .state
                    .textFieldHeightList[index * 2 + 1],
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
                list[index],
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Public Sans',
                  letterSpacing: 2,
                  fontVariations: [
                    FontVariation('wght', 200),
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

Widget halfHourTextField(
    {required BuildContext context,
    required List<TextEditingController> textEditingControllerList}) {
  return Stack(
    children: [
      Column(
        children: List.generate(
          12 + context.read<HalfHourTextFieldCubit>().state.additionalLines,
          (index) {
            return Container(
              width: appbarLength(context) * 5,
              height: todayScreenTimeWidgetHeight(context) / 2,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(
                  bottom: (index ==
                          (12 +
                                  context
                                      .read<HalfHourTextFieldCubit>()
                                      .state
                                      .additionalLines) -
                              1)
                      ? BorderSide.none
                      : mainBorderSide,
                ),
              ),
            );
          },
        ),
      ),
      Column(
        children: List.generate(
          12,
          (index) {
            return BlocBuilder<HalfHourTextFieldCubit, HalfHourTextField>(
                builder: (context, state) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: state.textFieldHeightList[index],
                  width: appbarLength(context) * 5,
                  child: CupertinoTextField(
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    controller: textEditingControllerList[index],
                    textAlignVertical: TextAlignVertical.center,
                    padding: EdgeInsets.only(left: 8),
                    cursorHeight: textFontSize,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: textFontSize,
                      height: todayScreenTimeWidgetHeight(context) /
                          2 /
                          textFontSize,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    onChanged: (value) {
                      final lines = '\n'.allMatches(value).length + 1;
                      context
                          .read<HalfHourTextFieldCubit>()
                          .updateLinesList(index, lines);
                      context
                          .read<HalfHourTextFieldCubit>()
                          .getAdditionalLines(index, lines);
                      context
                          .read<HalfHourTextFieldCubit>()
                          .updateTextFieldHeight(
                              index,
                              (todayScreenTimeWidgetHeight(context) / 2) *
                                  lines);
                      context
                          .read<HalfHourTextFieldCubit>()
                          .addTextFieldHeight();
                    },
                    maxLines: null,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: index == 11 ? BorderSide.none : mainBorderSide,
                      ),
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    ],
  );
}

Widget todayTextField(
    BuildContext context, TextEditingController textEditingController) {
  return Stack(
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
          cursorHeight: textFontSize,
          style: TextStyle(
            color: blackColor,
            fontSize: textFontSize,
            height: todayScreenTimeWidgetHeight(context) / 2 / textFontSize,
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
                    fontSize: textFontSize,
                    height:
                        todayScreenTimeWidgetHeight(context) / 2 / textFontSize,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                );
                final textPainter = TextPainter(
                    text: textSpan, textDirection: TextDirection.ltr);
                textPainter.layout(maxWidth: appbarLength(context) * 5 - 8);
                if (textPainter.size.width == appbarLength(context) * 5 - 8 &&
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
          minLines: 12,
          //todo 기본적으로 12줄이 있어야 함. 엔터를 누르면 다음 줄로 이동하는 기능도 있어야 함.
        ),
      ),
    ],
  );
}
