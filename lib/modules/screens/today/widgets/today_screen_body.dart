import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:lindi_sticker_widget/lindi_sticker_icon.dart';
import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_text_field_cubit.dart';
import 'package:mecore/modules/bloc/wheel_chooser_cubit.dart';
import 'package:mecore/modules/models/half_hour_text_field.dart';
import 'package:mecore/modules/models/lindi.dart';
import 'package:mecore/modules/bloc/lindi_cubit.dart';
import 'package:mecore/modules/screens/today/time/night_screen.dart';
import 'package:mecore/modules/screens/today/today_screen.dart';
import 'package:mecore/modules/screens/today/time/afternoon_screen.dart';
import 'package:mecore/modules/screens/today/widgets/body_header.dart';
import 'package:mecore/modules/screens/today/time/evening_screen.dart';
import 'package:mecore/modules/screens/today/time/morning_screen.dart';
import 'package:mecore/widgets/containers/weather_icon_container.dart';

class TodayScreenBody extends StatefulWidget {
  static late double textFieldHeight;
  const TodayScreenBody({super.key});

  @override
  State<TodayScreenBody> createState() => _TodayScreenBodyState();
}

class _TodayScreenBodyState extends State<TodayScreenBody> {
  late LindiController lindiController;
  List<Widget> morningWidgets = [];
  int? selectedWidgetKey;

  @override
  void initState() {
    lindiController = LindiController(
      shouldRotate: false,
      insidePadding: 0,
      borderWidth: 1,
      borderColor: blackColor,
      icons: [
        LindiStickerIcon(
          icon: CupertinoIcons.checkmark,
          backgroundColor: blackColor,
          iconColor: backgroundColor,
          alignment: Alignment.topCenter,
          onTap: () {
            lindiController.selectedWidget!.done();
          },
        ),
        LindiStickerIcon(
          icon: CupertinoIcons.xmark,
          backgroundColor: blackColor,
          iconColor: backgroundColor,
          alignment: Alignment.topLeft,
          onTap: () async {
            selectedWidgetKey =
                (lindiController.selectedWidget?.child.key as ValueKey).value;
            lindiController.selectedWidget!.delete();
            context.read<LindiCubit>().delete(ValueKey(selectedWidgetKey));
            //context.read<LindiCubit>().isDeleted(ValueKey(selectedWidgetKey));
          },
        ),
        LindiStickerIcon(
            icon: CupertinoIcons.layers,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.topRight,
            onTap: () {
              lindiController.selectedWidget!.stack();
            }),
        LindiStickerIcon(
            icon: Icons.flip,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.bottomCenter,
            onTap: () {
              lindiController.selectedWidget!.flip();
            }),
        LindiStickerIcon(
            icon: CupertinoIcons.crop,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.bottomLeft,
            type: IconType.resize),
        LindiStickerIcon(
            icon: CupertinoIcons.crop,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.bottomRight,
            type: IconType.resize),
      ],
    );

    lindiController.onPositionChange((index) {
      print("widgets size: ${lindiController.widgets.length}, current index: $index");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodayScreenBody.textFieldHeight = todayScreenTimeWidgetHeight(context) / 2;

    String timeValue = context.watch<WheelChooserCubit>().state;
      return BlocBuilder<LindiCubit, List<Lindi>>(
        builder: (context, state) {
          //todo: clear하고 다시 widget을 만드는게 비효율임. 삭제된 widget만 제거할 수 있는 로직 추가 필요.

          List<Key> compareList=[];
          for(var widget in lindiController.widgets){
            if(widget.key==null) continue;
            final widgetKey = (widget.child.key as ValueKey).value;
            compareList.add(ValueKey(widgetKey));
          }

          for (var lindi in state) {
            if(!compareList.contains(lindi.key)){
              lindiController.add(
                SizedBox(
                  key: lindi.key,
                  width: 100,
                  height: 100,
                  child: Image.network(lindi.url),
                ),
              );
            }
          }

          return ClipRect(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: BlocBuilder<HalfHourTextFieldCubit, HalfHourTextField>(
                builder: (context, state) {
                  return SizedBox(
                    width: screenWidth(context),
                    height: todayScreenBodyHeight(context) + state.additionalHeight,
                    child: LindiStickerWidget(
                      controller: lindiController,
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     AnimatedEmojiWidget(),
                          //     MusicWidget(),
                          //   ],
                          // ),
                          BodyHeader(),
                          if (timeValue == 'MORNING') MorningScreen(),
                          if (timeValue == 'AFTERNOON') AfternoonScreen(),
                          if (timeValue == 'EVENING') EveningScreen(),
                          if (timeValue == 'NIGHT') NightScreen(),
                          if (MediaQuery.of(context).viewInsets.bottom > 0) Container(
                            width: screenWidth(context),
                            height: MediaQuery.of(context).viewInsets.bottom,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              border: Border(top: mainBorderSide),
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
                          /*
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
                          */
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          );
        }
      );
  }
}
