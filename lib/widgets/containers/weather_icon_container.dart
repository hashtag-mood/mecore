import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/weather_icon_cubit.dart';
import 'package:mecore/modules/models/weather_icon.dart';

class WeatherIconContainer extends StatelessWidget {
  const WeatherIconContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appbarLength(context) * 5 - 1,
      decoration: BoxDecoration(
        border: Border(bottom: mainBorderSide),
        color: backgroundColor,
      ),
      child: BlocBuilder<WeatherIconCubit, WeatherIcon>(
        builder: (context, state) {
          return Row(
            children: List<Widget>.generate(
              7,
              (index) {
                return Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right:
                                index == 6 ? BorderSide.none : mainBorderSide),
                      ),
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<WeatherIconCubit>()
                              .toggleWeatherIcon(index);
                          //setState(() {});
                        },
                        child: context
                            .read<WeatherIconCubit>()
                            .weatherIconList[index]
                            .initialText,
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          overlayColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
