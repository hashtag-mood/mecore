import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';
import 'package:mecore/utils/number_formatter.dart';
import 'package:mecore/utils/hour_text.dart';
import 'package:mecore/widgets/containers/animated_emoji_container.dart';
import 'package:mecore/widgets/containers/weather_icon_container.dart';

class TodayScreenBody extends StatefulWidget {
  const TodayScreenBody({
    super.key,
  });

  @override
  State<TodayScreenBody> createState() => _TodayScreenBodyState();
}

class _TodayScreenBodyState extends State<TodayScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    WeatherIconContainer(),
                    Row(
                      children: [
                        AnimatedEmojiContainer(),
                        // CustomEmojiContainer(),
                        Container(
                          width: appbarLength(context) * 5 / 7 * 5 + 0.3,
                          height: musicContainerHeight(context),
                          child: Column(
                            children: [
                              Container(
                                width: appbarLength(context) * 5 / 7 * 5 + 0.3,
                                height: musicContainerHeight(context) / 2,
                                decoration: BoxDecoration(
                                  border: Border(bottom: mainBorderSide),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: appbarLength(context) * 5 / 7 - 1,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/icons/plus_48.png'),
                                          width: appbarLength(context) * 0.25,
                                          height: appbarLength(context) * 0.25,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: appbarLength(context) * 5 / 7 * 5 +
                                          0.3 -
                                          appbarLength(context) * 5 / 7 * 1.6,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoTextField.borderless(
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            NumberFormatter(),
                                          ],
                                          maxLength: 17,
                                          placeholder: 'INCOME',
                                          textAlign: TextAlign.right,
                                          padding: EdgeInsets.only(right: 2),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: blackColor,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.zero,
                                      width:
                                          appbarLength(context) * 5 / 7 * 0.6,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '₩', // TODO change the currency symbol based on user selection
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: appbarLength(context) * 5 / 7 * 5 + 0.3,
                                height: musicContainerHeight(context) / 2,
                                child: Row(
                                  children: [
                                    Container(
                                      width: appbarLength(context) * 5 / 7 - 1,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/icons/minus.png'),
                                          width: appbarLength(context) * 0.25,
                                          height: appbarLength(context) * 0.25,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: appbarLength(context) * 5 / 7 * 5 +
                                          0.3 -
                                          appbarLength(context) * 5 / 7 * 1.6,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoTextField.borderless(
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            NumberFormatter(),
                                          ],
                                          maxLength: 17,
                                          placeholder: 'EXPENSES',
                                          textAlign: TextAlign.right,
                                          padding: EdgeInsets.only(right: 2),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: blackColor,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.zero,
                                      width:
                                          appbarLength(context) * 5 / 7 * 0.6,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '₩',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            border: Border(
                              left: mainBorderSide,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: appbarLength(context) * 2 + 1,
                  height: appbarLength(context) * 2 + 1,
                  decoration: BoxDecoration(
                    border: Border(
                      left: mainBorderSide,
                    ),
                  ),
                  child: Image(
                    image: AssetImage('assets/img/album_cover.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Container(
              width: screenWidth(context),
              height: appbarLength(context),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(top: mainBorderSide, bottom: mainBorderSide),
              ),
              child: CupertinoTextField.borderless(
                padding: EdgeInsets.only(left: 8),
                style: TextStyle(color: blackColor, fontSize: 15),
                placeholder: 'COMMENT',
                placeholderStyle: TextStyle(
                  fontSize: 15,
                  color: textSilverColor,
                ),
                minLines: 1,
                maxLines: 2,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
              ),
            ),
            // TODO favoirte colors
            // TODO weather, today emoji, comment, and color picker to Stack
            BlocBuilder<HalfHourColorCellsCubit, HalfHourColorCells>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    height: appbarLength(context),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border(bottom: mainBorderSide),
                    ),
                    child: Row(
                      children: List.generate(
                        everyColors().length,
                        (index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.5),
                              width: appbarLength(context) * 0.57,
                              height: appbarLength(context) * 0.57,
                              decoration: BoxDecoration(
                                color: everyColors()[index],
                                border: Border.all(color: blackColor, width: 1),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                Column(
                  children: List.generate(
                    24,
                    (index) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: appbarLength(context) * 1.7,
                          width: appbarLength(context),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            border: Border(
                              right: mainBorderSide,
                              bottom: index == 23
                                  ? BorderSide.none
                                  : mainBorderSide,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              hourText(index),
                              style: TextStyle(
                                fontSize: 20,
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
                              height: appbarLength(context) * 1.7 * 1 / 2,
                              width: appbarLength(context) * 0.65,
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
                                onPanEnd: (details) {},
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
                          height: appbarLength(context) * 1.7 * 1 / 2,
                          width: screenWidth(context) -
                              appbarLength(context) * 1.65,
                          child: CupertinoTextField(
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
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
