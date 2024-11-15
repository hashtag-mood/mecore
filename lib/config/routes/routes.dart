import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/modules/screens/auth/name_screen.dart';
import 'package:mecore/modules/screens/journal_screen.dart';
import 'package:mecore/modules/screens/onboarding_screen.dart';
import 'package:mecore/modules/screens/setting_screen.dart';
import 'package:mecore/modules/screens/today_edit_screen.dart';
import 'package:mecore/modules/screens/today_record_screen.dart';
import 'package:mecore/modules/screens/today/today_screen.dart';
import 'package:mecore/widgets/custom_bottom_navigation_bar.dart';

final GlobalKey<NavigatorState> _todayNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _calendarNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _journalNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingNavigatorKey =
    GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/onboarding',
  // (FirebaseAuth.instance.currentUser == null) ? '/onboarding' : '/today',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomBottomNavigationBar(
          index: navigationShell.currentIndex,
          navigationShell: navigationShell,
          onDestinationSelected: (index) {
            navigationShell.goBranch(index,
                initialLocation: index == navigationShell.currentIndex);
          },
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _todayNavigatorKey,
          routes: [
            GoRoute(
              path: '/today',
              builder: (context, state) => TodayScreen(
                recordPath: '/record',
                editPath: '/edit',
              ),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => TodayEditScreen(),
                ),
                GoRoute(
                  path: 'record',
                  builder: (context, state) => TodayRecordScreen(),
                ),
              ],
            ),
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: _calendarNavigatorKey,
        //   routes: [
        //     GoRoute(
        //       path: '/calendar',
        //       builder: (context, state) => CalendarScreen(
        //         tasksPath: '/tasks',
        //         searchPath: '/search',
        //       ),
        //       routes: [
        //         GoRoute(
        //           path: 'tasks',
        //           builder: (context, state) => TasksScreen(),
        //         ),
        //         GoRoute(path: 'search', builder: (context, state) => SearchScreen(),),
        //       ],
        //     ),
        //   ],
        // ),
        StatefulShellBranch(
          navigatorKey: _journalNavigatorKey,
          routes: [
            GoRoute(
              path: '/journal',
              builder: (context, state) => JournalScreen(
                recordPath: '/record',
              ),
              routes: [
                GoRoute(
                  path: 'record',
                  builder: (context, state) => TodayRecordScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingNavigatorKey,
          routes: [
            GoRoute(
              path: '/setting',
              builder: (context, state) => SettingScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/name',
      builder: (context, state) => NameScreen(),
    ),
  ],
);

GoRouter get router => _router;
