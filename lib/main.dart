import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mecore/config/routes/routes.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/firebase_options.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/bloc/half_hour_text_field_cubit.dart';
import 'package:mecore/modules/bloc/journal_date_cubit.dart';
import 'package:mecore/modules/bloc/setting_cubit.dart';
import 'package:mecore/modules/bloc/single_line_text_cubit.dart';
import 'package:mecore/modules/bloc/today_date_cubit.dart';
import 'package:mecore/modules/bloc/user_image_cubit.dart';
import 'package:mecore/modules/bloc/weather_icon_cubit.dart';
import 'package:mecore/modules/bloc/wheel_chooser_cubit.dart';
import 'package:mecore/modules/bloc/lindi_cubit.dart';
import 'package:mecore/modules/models/half_hour_text_field.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const mecore());
}

class mecore extends StatelessWidget {
  const mecore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DateCubit(),
        ),
        BlocProvider(
          create: (context) => TodayDateCubit(),
        ),
        BlocProvider(
          create: (context) => JournalDateCubit(),
        ),
        BlocProvider(
          create: (context) => WeatherIconCubit(),
        ),
        BlocProvider(
          create: (context) => HalfHourColorCellsCubit(),
        ),
        BlocProvider(
          create: (context) => SingleLineTextCubit(),
        ),
        BlocProvider(
          create: (context) => LindiCubit(),
        ),
        BlocProvider(
          create: (context) => WheelChooserCubit(),
        ),
        BlocProvider(
          create: (context) => UserImageCubit(),
        ),
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
        BlocProvider(
          create: (context) => HalfHourTextFieldCubit(
            HalfHourTextField(
              textFieldHeightList:
                  List.filled(12, TodayScreenBody.textFieldHeight),
              linesList: List.filled(12, 1),
              additionalLines: 0,
              additionalHeight: 0,
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: Locale('ko', ''),
        supportedLocales: [
          Locale('en', ''),
          Locale('ko', ''),
          Locale('ja', ''),
        ],
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          fontFamily: 'Interop Regular',
          cupertinoOverrideTheme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                fontFamily: 'Interop Regular',
              ),
            ),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
