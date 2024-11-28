import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_date_picker_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_save_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_sticker_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_today_record_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_user_image.dart';
import 'package:mecore/widgets/date_pickers/custom_cupertino_date_picker.dart';

class TodayScreenAppbar extends StatefulWidget {
  LindiController lindiController;
  TodayScreenAppbar({super.key, required this.lindiController});

  @override
  State<TodayScreenAppbar> createState() => _TodayScreenAppbarState();
}

class _TodayScreenAppbarState extends State<TodayScreenAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: appbarLength(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.symmetric(horizontal: mainBorderSide),
      ),
      child: Row(
        children: [
          AppbarTodayRecordButton(),
          AppbarUserImage(),
          AppbarDatePickerButton(
            onPressedCallback: () async {
              await customCupertinoDatePicker.selectDate(
                context,
                    (month) {
                  context.read<DateCubit>().updateMonth(month);
                },
                    (day) {
                  context.read<DateCubit>().updateDay(day);
                },
                    (year) {
                  context.read<DateCubit>().updateYear(year);
                },
              );
              // await customDatePicker.selectDate(context, () {
              //   setState(
              //     () {},
              //   );
              // },);
            },
          ),
          // AppbarSearchIconButton(),
          AppbarStickerButton(lindiController: widget.lindiController,),
          AppbarSaveButton(),
          //AppbarPopupMenuButton(
          //  onSelectedCallback: () {
          //    setState(() {});
          // },
          //),
        ],
      ),
    );
  }
}
