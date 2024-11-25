import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class DDayWidget extends StatefulWidget {
  const DDayWidget({super.key});

  @override
  State<DDayWidget> createState() => _DDayWidgetState();
}

class _DDayWidgetState extends State<DDayWidget> {
  TextEditingController dDayNumberEditingController = TextEditingController();
  int? dDayNumber;

  @override
  Widget build(BuildContext context) {
    return Container( // TODO handle with cubit
      width: appbarLength(context) * 2,
      height: appbarLength(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
            bottom: mainBorderSide, right: mainBorderSide),
      ),
      child: TextButton(
        onPressed: () async {
          showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (context) {
              return AlertDialog(
                shape:
                Border.all(width: 1, color: blackColor),
                backgroundColor: backgroundColor,
                actionsPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.symmetric(vertical: 1),
                title: null,
                content: SizedBox(
                  width: 90,
                  height: appbarLength(context),
                  child: CupertinoTextField.borderless(
                    controller: dDayNumberEditingController,
                    padding: EdgeInsets.zero,
                    style: TextStyle(
                        fontFamily: 'Unbounded Medium',
                        color: blackColor,
                        fontSize: 20),
                    placeholder: 'DAYS',
                    placeholderStyle: TextStyle(
                        fontFamily: 'Unbounded Medium',
                        fontSize: 19,
                        color: textSilverColor),
                    minLines: 1,
                    maxLength: 3,
                    textAlignVertical:
                    TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        dDayNumberEditingController.text =
                            value;
                      });
                    },
                  ),
                ),
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
                              setState(() {
                                dDayNumberEditingController
                                    .text = '';
                              });
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
                  ),
                ],
              );
            },
          );
        },
        style: ButtonStyle(
          overlayColor:
          WidgetStatePropertyAll(Colors.transparent),
        ),
        child: Text(
          (dDayNumberEditingController.text.isEmpty)
              ? 'D–DAY'
              : 'D–${dDayNumberEditingController.text}',
          style: (dDayNumberEditingController.text.isEmpty) ? TextStyle(
              fontFamily: 'Unbounded Medium',
              fontSize: 19,
              color: textSilverColor) : TextStyle(
              fontFamily: 'Unbounded Medium',
              fontSize: 19,
              color: blackColor),
        ),
      ),
    );
  }
}
