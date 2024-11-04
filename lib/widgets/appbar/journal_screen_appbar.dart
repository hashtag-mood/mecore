import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_date_picker_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_journal_record_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_save_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_sticker_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_user_image.dart';
import 'package:mecore/widgets/date_pickers/custom_cupertino_date_picker.dart';

class JournalScreenAppbar extends StatefulWidget {
  const JournalScreenAppbar({super.key});

  @override
  State<JournalScreenAppbar> createState() => _JournalScreenAppbarState();
}

class _JournalScreenAppbarState extends State<JournalScreenAppbar> {
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
          AppbarJournalRecordButton(),
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
          AppbarStickerButton(),
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
