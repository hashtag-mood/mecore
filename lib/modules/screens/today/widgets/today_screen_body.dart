import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:lindi_sticker_widget/lindi_sticker_icon.dart';
import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/models/lindi.dart';
import 'package:mecore/modules/models/lindi_cubit.dart';
import 'package:mecore/modules/screens/today/widgets/half_hour_color_cells_widget.dart';
import 'package:mecore/modules/screens/today/widgets/music_widget.dart';
import 'package:mecore/utils/hour_text.dart';
import 'package:mecore/modules/screens/today/widgets/animated_emoji_widget.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_sticker_button.dart';

class TodayScreenBody extends StatefulWidget {
  LindiController lindiController;

  TodayScreenBody({super.key, required this.lindiController});

  @override
  State<TodayScreenBody> createState() => _TodayScreenBodyState();
}

class _TodayScreenBodyState extends State<TodayScreenBody> {
  List<Widget> widgets = [];
  String? text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LindiCubit, List<Lindi>>(builder: (context, state) {
      //todo: clear하고 다시 widget을 만드는게 비효율임. 삭제된 widget만 제거할 수 있는 로직 추가 필요.
      widgets.clear();

      for (var stickerData in state) {
        widgets.firstWhere(
          (w) => w.key == stickerData.key,
          orElse: () {
            print('add');
            widgets.add(
              SizedBox(
                key: stickerData.key,
                width: 100,
                height: 100,
                child: Image.network(stickerData.url),
              ),
            );
            return SizedBox();
          }, // 검색 결과가 없을 경우 null 반환
        );
      }

      widget.lindiController.addAll(widgets);

      return ClipRect(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SizedBox(
            width: screenWidth(context),
            height: MediaQuery.of(context).size.height +
                1690, // todo: 화면 height 구하기
            child: LindiStickerWidget(
              controller: widget.lindiController,
              child: Column(
                children: [
                  Row(
                    children: [
                      AnimatedEmojiWidget(),
                      MusicWidget(),
                    ],
                  ),
                  Container(
                    width: screenWidth(context),
                    height: appbarLength(context) * 2,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border(bottom: mainBorderSide),
                    ),
                    child: CupertinoTextField.borderless(
                      padding: EdgeInsets.only(left: 8),
                      style: TextStyle(
                          color: blackColor, fontSize: 19, height: 1.5),
                      placeholder: 'COMMENT',
                      placeholderStyle: TextStyle(
                        fontSize: 19,
                        color: textSilverColor,
                      ),
                      minLines: 1,
                      maxLines: 3,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,
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
                      HalfHourColorCellsWidget(),
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
          ),
        ),
      );
    });
  }
}
