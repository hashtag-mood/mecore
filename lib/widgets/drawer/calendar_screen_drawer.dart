import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/screens/calendar_screen.dart';
import 'package:mecore/modules/screens/today/today_screen.dart';
import 'package:mecore/widgets/drawer/drawer_divider.dart';
import 'package:mecore/widgets/drawer/drawer_list_tile.dart';
import 'package:mecore/widgets/drawer/drawer_logo_image.dart';
import 'package:mecore/widgets/drawer/drawer_user_calendars_silver.dart';

class CalendarScreenDrawer extends StatelessWidget {
  const CalendarScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: drawerWidth(context),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          DrawerLogoImage(),
          Expanded(
            child: Container(
              height: appbarLength(context),
              alignment: Alignment.centerLeft,
              child: ListView(
                children: [
                  DrawerDivider(
                    border: Border(bottom: mainBorderSide),
                  ),
                  DrawerListTile(
                    leading: '💌',
                    title: 'MONTHLY',
                    onTapCallback: () async {
                      await Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CalendarScreen(),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    leading: '📍',
                    title: 'TO-DO',
                    onTapCallback: () {},
                  ),
                  DrawerListTile(
                    leading: '🧸',
                    title: 'TODAY',
                    onTapCallback: () async {
                      await Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TodayScreen(),
                        ),
                      );
                    },
                  ),
                  DrawerListTile(
                    leading: '🖋',
                    title: 'JOURNAL',
                    onTapCallback: () {},
                  ),
                  DrawerListTile(
                    leading: '📓',
                    title: 'RECORD',
                    onTapCallback: () {},
                  ),
                  DrawerDivider(
                    border: Border(top: mainBorderSide, bottom: mainBorderSide),
                  ),
                  DrawerUserCalendarsSilver(
                    emoji: '🦥',
                    title: 'NOT URGENT CALENDAR',
                  ),
                  DrawerUserCalendarsSilver(
                      emoji: '💥', title: 'URGENT CALENDAR'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
