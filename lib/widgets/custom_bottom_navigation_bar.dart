import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell? navigationShell;
  final int index;
  final void Function(int)? onDestinationSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.navigationShell,
    required this.index,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: mainBorderSide),
        ),
        child: NavigationBar(
          onDestinationSelected: onDestinationSelected,
          selectedIndex: index,
          height: appbarLength(context),
          backgroundColor: backgroundColor,
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(
              icon: Icon(CupertinoIcons.burst),
              label: 'TODAY',
              selectedIcon: Icon(CupertinoIcons.burst_fill),
            ),
            // NavigationDestination(
            //   icon: Icon(CupertinoIcons.flag),
            //   label: 'CALENDAR',
            //   selectedIcon: Icon(CupertinoIcons.flag_fill),
            // ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.quote_bubble),
              label: 'JOURNAL',
              selectedIcon: Icon(CupertinoIcons.quote_bubble_fill),
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.wrench),
              label: 'SETTING',
              selectedIcon: Icon(CupertinoIcons.wrench_fill),
            ),
          ],
        ),
      ),
    );
  }
}
