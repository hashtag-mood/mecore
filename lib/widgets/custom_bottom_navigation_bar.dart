import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:colorful_iconify_flutter/icons/noto.dart';
import 'package:colorful_iconify_flutter/icons/fxemoji.dart';
import 'package:iconify_flutter/icons/wpf.dart';
import 'package:iconify_flutter/icons/raphael.dart';
import 'package:iconify_flutter/icons/gis.dart';
import 'package:iconify_flutter/icons/clarity.dart';

import 'package:iconify_flutter/icons/uiw.dart';

import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/vaadin.dart';
import 'package:iconify_flutter/icons/foundation.dart';
import 'package:intl/intl.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';

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
          border: Border(top: mainBorderSide, bottom: mainBorderSide),
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
              icon: Text('ೀ⋆｡🌷', style: TextStyle(fontSize: navigationIconSize),),

              // icon: Text('₊˚ 🦢・₊✧', style: TextStyle(fontSize: navigationIconSize),),
              label: 'TODAY',
            ),
            // NavigationDestination(
            //   icon: Icon(CupertinoIcons.flag),
            //   label: 'CALENDAR',
            //   selectedIcon: Icon(CupertinoIcons.flag_fill),
            // ),
            NavigationDestination(
              icon: Text(
                '‧₊˚🍮‧₊˚', style: TextStyle(fontSize: navigationIconSize),),

              //icon: Text('｡˚🐈‍⬛.𖥔 ݁ ˖', style: TextStyle(fontSize: navigationIconSize),),
              label: 'JOURNAL',
            ),
            NavigationDestination(
              icon: Text('🎸⋆⭒˚｡⋆', style: TextStyle(fontSize: navigationIconSize),),
              //icon: Text('★🎸🎧⋆｡', style: TextStyle(fontSize: navigationIconSize),),
              label: 'SETTING',
            ),
          ],
        ),
      ),
    );
  }
}
