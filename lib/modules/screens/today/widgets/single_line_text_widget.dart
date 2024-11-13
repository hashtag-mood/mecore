import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/single_line_text_cubit.dart';
import 'package:mecore/modules/models/single_line_text.dart';

class SingleLineTextWidget extends StatelessWidget {
  const SingleLineTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleLineTextCubit, SingleLineText>(
        builder: (context, state) {
      return Container(
        width: appbarLength(context) * 5,
        height: appbarLength(context),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: mainBorderSide),
        ),
        child: GestureDetector(
            onTap: () async {
              showDialog(
                context: context,
                barrierColor: Colors.transparent,
                builder: (context) {
                  return AlertDialog(
                    shape: Border.all(width: 1, color: blackColor),
                    backgroundColor: backgroundColor,
                    actionsPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.all(5),
                    title: null,
                    content: Container(
                      width: 175,
                      height: appbarLength(context),
                      child: CupertinoTextField.borderless(
                        controller: state.textEditingController,
                        onEditingComplete: () {
                          context.read<SingleLineTextCubit>().updateText(
                              completeText: state.textEditingController.text);
                        },
                        // textMarqueeEditingController,
                        padding: EdgeInsets.only(left: 8),
                        style: TextStyle(color: blackColor, fontSize: 19),
                        placeholder: 'TEXT',
                        placeholderStyle: TextStyle(
                          fontSize: 19,
                          color: textSilverColor,
                        ),
                        minLines: 1,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,

                        // onEditingComplete: () {
                        //   completeText = textMarqueeEditingController.text;
                        // },
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
                              width: 175,
                              height: appbarLength(context),
                              decoration: BoxDecoration(
                                border: Border(right: mainBorderSide),
                              ),
                              child: CupertinoButton(
                                onPressed: () {
                                  context
                                      .read<SingleLineTextCubit>()
                                      .updateControllerText(
                                          controllerText: state
                                              .textEditingController.text = '');
                                  context
                                      .read<SingleLineTextCubit>()
                                      .updateText(completeText: '');
                                  // setState(() {
                                  //   textMarqueeEditingController
                                  //       .text = '';
                                  // });
                                },
                                child: Text(
                                  'RESET',
                                  style: TextStyle(
                                      fontFamily: 'Unbounded Medium',
                                      fontSize: 20,
                                      color: blackColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 175,
                              height: appbarLength(context),
                              child: CupertinoButton(
                                onPressed: () {
                                  context
                                      .read<SingleLineTextCubit>()
                                      .updateText(
                                          completeText:
                                              state.textEditingController.text);
                                  // setState(() {
                                  //   completeText = textMarqueeEditingController.text;
                                  // });
                                  context.pop();
                                },
                                child: Text(
                                  'SELECT',
                                  style: TextStyle(
                                      fontFamily: 'Unbounded Medium',
                                      fontSize: 20,
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
            child: (state.completeText ==
                    '') // (textMarqueeEditingController.text.isEmpty)
                ? Container(
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    child: MarqueeText(
                      text: TextSpan(
                          text: state.placeholderText,
                          style:
                              TextStyle(fontSize: 19, color: textSilverColor)),
                      speed: 30,
                    ))
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Align(alignment: Alignment.center, child: Text(state.placeholderText, style: TextStyle(fontSize: 19, color: textSilverColor),)),
                // )
                //Marquee(text: state.placeholderText, style: TextStyle(fontSize: 19, color: textSilverColor), blankSpace: 5, velocity: 45)
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: TextMarquee(
                //           state.placeholderText,
                //           // textMarqueeEditingController.text,
                //           delay: Duration(seconds: 0),
                //           spaceSize: 6,
                //           style: TextStyle(
                //               fontSize: 19, color: textSilverColor),
                //         ),
                // )
                : Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 8),
                    child: MarqueeText(
                      text: TextSpan(
                          text: state.completeText,
                          style: TextStyle(fontSize: 19, color: blackColor)),
                      speed: 30,
                    ),
                  )
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Align(alignment: Alignment.center, child: Text(state.completeText, style: TextStyle(fontSize: 19, color: blackColor),)),
            // )
            // Marquee(text: state.completeText, style: TextStyle(fontSize: 19, color: blackColor), blankSpace: 5, velocity: 45)
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: TextMarquee(
            //           state.completeText,
            //           // completeText,
            //           delay: Duration(seconds: 0),
            //           spaceSize: 6,
            //           style: TextStyle(
            //               fontSize: 19, color: blackColor),
            //         ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Text(
            //     '뜨거운 여름밤은 가고 남은 건 볼품없지만',
            //     style: TextStyle(fontSize: 19, color: blackColor),
            //   ),
            // ),
            ),
      );
    });
  }
}
