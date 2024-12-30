import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/wheel_chooser_cubit.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class WheelChooserWidget extends StatelessWidget {
  const WheelChooserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: appbarLength(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(bottom: mainBorderSide),
      ),
      child: WheelChooser(
        magnification: 1.5,
        onValueChanged: (value) {
          context.read<WheelChooserCubit>().updateValue(value: value);
        },
        isInfinite: true,
        itemSize: 200,
        unSelectTextStyle: TextStyle(color: textSilverColor, fontSize: 10, fontFamily: 'Unbounded SemiBold'),
        selectTextStyle: TextStyle(color: blackColor, fontSize: 10, fontFamily: 'Unbounded SemiBold'),
        // datas: ['5', '6', '7', '8', '9', '10', '11', '12', '1', '2', '3', '4',
        //   '5', '6', '7', '8', '9', '10', '11', '12', '1', '2', '3', '4'],
        // datas: ['5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16',
        //   '17', '18', '19', '20', '21', '22', '23', '24', '1', '2', '3', '4'],
        datas: ['MORNING', 'AFTERNOON', 'EVENING', 'NIGHT'],
        horizontal: true,
        startPosition: 0,
      ),
    );
  }
}
