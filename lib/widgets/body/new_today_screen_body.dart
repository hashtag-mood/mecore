import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/bloc/text_marquee_cubit.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';
import 'package:mecore/modules/models/text_marquee_model.dart';
import 'package:mecore/utils/hour_text.dart';
import 'package:mecore/widgets/containers/animated_emoji_container.dart';
import 'package:text_marquee/text_marquee.dart';

class NewTodayScreenBody extends StatefulWidget {
  const NewTodayScreenBody({super.key});

  @override
  State<NewTodayScreenBody> createState() => _NewTodayScreenBodyState();
}

class _NewTodayScreenBodyState extends State<NewTodayScreenBody> {
  // TextEditingController textMarqueeEditingController = TextEditingController();
  // String completeText = '';
  TextEditingController dDayNumberEditingController = TextEditingController();
  int? dDayNumber;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: mainBorderSide),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
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
                                  contentPadding: EdgeInsets.zero,
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
                                          fontSize: 20,
                                          color: textSilverColor),
                                      minLines: 1,
                                      maxLength: 4,
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
                                            width: 175,
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
                                                context.pop();
                                              },
                                              child: Text(
                                                'SELECT',
                                                style: TextStyle(
                                                    fontSize: 20,
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
                            style: TextStyle(
                                fontFamily: 'Unbounded Medium',
                                fontSize: 20,
                                color: blackColor),
                          ),
                        ),
                      ),
                      AnimatedEmojiContainer(),
                    ],
                  ),
                  Column(
                    children: [
                      BlocBuilder<TextMarqueeCubit, TextMarqueeModel>(
                          builder: (context, state) {
                        return Container(
                          width: appbarLength(context) * 5,
                          height: appbarLength(context),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            border: Border(bottom: mainBorderSide),
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
                                    contentPadding: EdgeInsets.all(5),
                                    title: null,
                                    content: Container(
                                      width: 175,
                                      height: appbarLength(context),
                                      child: CupertinoTextField.borderless(
                                        controller: state.textEditingController,
                                        onEditingComplete: () {
                                          context
                                              .read<TextMarqueeCubit>()
                                              .updateText(
                                                  completeText: state
                                                      .textEditingController
                                                      .text);
                                        },
                                        // textMarqueeEditingController,
                                        padding: EdgeInsets.only(left: 8),
                                        style: TextStyle(
                                            color: blackColor, fontSize: 19),
                                        placeholder: 'TEXT',
                                        placeholderStyle: TextStyle(
                                          fontSize: 19,
                                          color: textSilverColor,
                                        ),
                                        minLines: 1,
                                        textAlignVertical:
                                            TextAlignVertical.center,
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
                                                border: Border(
                                                    right: mainBorderSide),
                                              ),
                                              child: CupertinoButton(
                                                onPressed: () {
                                                  context
                                                      .read<TextMarqueeCubit>()
                                                      .updateControllerText(
                                                          controllerText: state
                                                              .textEditingController
                                                              .text = '');
                                                  context
                                                      .read<TextMarqueeCubit>()
                                                      .updateText(
                                                          completeText: '');
                                                  // setState(() {
                                                  //   textMarqueeEditingController
                                                  //       .text = '';
                                                  // });
                                                },
                                                child: Text(
                                                  'RESET',
                                                  style: TextStyle(
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
                                                      .read<TextMarqueeCubit>()
                                                      .updateText(
                                                      completeText: state
                                                          .textEditingController
                                                          .text);
                                                  // setState(() {
                                                  //   completeText = textMarqueeEditingController.text;
                                                  // });
                                                  context.pop();
                                                },
                                                child: Text(
                                                  'SELECT',
                                                  style: TextStyle(
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
                            style: ButtonStyle(
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                            ),
                            child: (state.completeText ==
                                    '') // (textMarqueeEditingController.text.isEmpty)
                                ?
                                TextMarquee(
                                        state.placeholderText,
                                        // textMarqueeEditingController.text,
                                        delay: Duration(seconds: 0),
                                        spaceSize: 6,
                                        style: TextStyle(
                                            fontSize: 19, color: textSilverColor),
                                      )
                                :
                            TextMarquee(
                                    state.completeText,
                                    // completeText,
                                    delay: Duration(seconds: 0),
                                    spaceSize: 6,
                                    style: TextStyle(
                                        fontSize: 19, color: blackColor),
                                  ),
                            // SingleChildScrollView(
                            //   scrollDirection: Axis.horizontal,
                            //   child: Text(
                            //     '뜨거운 여름밤은 가고 남은 건 볼품없지만',
                            //     style: TextStyle(fontSize: 19, color: blackColor),
                            //   ),
                            // ),
                          ),
                        );
                      }),
                      Container(
                        width: appbarLength(context) * 5,
                        height: appbarLength(context) * 2,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                        ),
                        child: CupertinoTextField.borderless(
                          padding: EdgeInsets.only(left: 8),
                          style: TextStyle(
                              color: blackColor, fontSize: 19, height: 1.35),
                          placeholder: 'COMMENT',
                          placeholderStyle: TextStyle(
                            fontSize: 19,
                            color: textSilverColor,
                          ),
                          minLines: 1,
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   width: screenWidth(context),
            //   height: appbarLength(context),
            //   decoration: BoxDecoration(
            //     color: backgroundColor,
            //     border: Border(bottom: mainBorderSide),
            //   ),
            //   child: CupertinoTextField.borderless(
            //     padding: EdgeInsets.only(left: 8),
            //     style: TextStyle(color: blackColor, fontSize: 19),
            //     placeholder: 'COMMENT',
            //     placeholderStyle: TextStyle(
            //       fontSize: 19,
            //       color: textSilverColor,
            //     ),
            //     minLines: 1,
            //     maxLines: 2,
            //     textAlignVertical: TextAlignVertical.center,
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            Row(
              children: [
                Column(
                  children: List.generate(
                    24,
                    (index) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: appbarLength(context) * 1.6,
                          width: appbarLength(context) * 4 / 3,
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
                              hourText(index),
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
                ),
                BlocBuilder<HalfHourColorCellsCubit, HalfHourColorCells>(
                  builder: (context, state) {
                    return Column(
                      children: List.generate(
                        48,
                        (index) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: appbarLength(context) * 1.6 * 1 / 2,
                              width: appbarLength(context) * 2 / 3,
                              // appbarLength(context) * 0.65,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                border: Border(
                                  right: mainBorderSide,
                                  bottom: index == 47
                                      ? BorderSide.none
                                      : mainBorderSide,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  return showDialog(
                                    context: context,
                                    barrierColor: Colors.transparent,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: Border.all(
                                            width: 1, color: blackColor),
                                        backgroundColor: backgroundColor,
                                        actionsPadding: EdgeInsets.zero,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                        title: null,
                                        content: SizedBox(
                                          width: 175,
                                          height: 300,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: 175,
                                                  height: 20,
                                                  child: Text('recent'),
                                                ),
                                                SizedBox(
                                                  width: 175,
                                                  height: 20,
                                                  child: Text('colors'),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.zero,
                                                  width: screenWidth(context),
                                                  height: 300,
                                                  child: GridView.builder(
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 8,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 10,
                                                    ),
                                                    itemCount:
                                                        everyColors().length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {},
                                                        child: AspectRatio(
                                                          aspectRatio: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  everyColors()[
                                                                      index],
                                                              border: Border.all(
                                                                  color:
                                                                      blackColor,
                                                                  width: 1),
                                                            ),
                                                            child: Icon(
                                                                CupertinoIcons
                                                                    .checkmark),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        actions: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: backgroundColor,
                                              border:
                                                  Border(top: mainBorderSide),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 175,
                                                  height: appbarLength(context),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: mainBorderSide),
                                                  ),
                                                  child: CupertinoButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'RESET',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Unbounded Medium',
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
                                                      context.pop();
                                                    },
                                                    child: Text(
                                                      'SELECT',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Unbounded Medium',
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
                    48,
                    (index) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: appbarLength(context) * 1.6 * 1 / 2,
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
                                bottom: index == 47
                                    ? BorderSide.none
                                    : mainBorderSide,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
