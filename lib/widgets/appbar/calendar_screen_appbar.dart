import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_date_picker_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_menu_icon_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_refresh_icon_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_search_icon_button.dart';
import 'package:mecore/widgets/appbar_buttons/appbar_user_image.dart';
import 'package:mecore/widgets/date_pickers/custom_material_date_picker.dart';

class CalendarScreenAppbar extends StatefulWidget {
  const CalendarScreenAppbar({super.key});

  @override
  State<CalendarScreenAppbar> createState() => _CalendarScreenAppbarState();
}

class _CalendarScreenAppbarState extends State<CalendarScreenAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: appbarLength(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.symmetric(
          horizontal: mainBorderSide,
        ),
      ),
      child: Row(
        children: [
          AppbarMenuIconButton(),
          AppbarUserImage(),
          AppbarDatePickerButton(
            onPressedCallback: () async {
              await customMaterialDatePicker.selectDate(context, () {
                setState(
                  () {},
                );
              });
            },
          ),
          AppbarSearchIconButton(),
          AppbarRefreshIconButton(onPressedCallback: () {
            setState(() {
              customMaterialDatePicker.refreshDate();
            });
          }),
        ],
      ),
    );
  }
}
