import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mecore/config/routes/routes.dart';
import 'package:mecore/firebase_options.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/bloc/text_marquee_cubit.dart';
import 'package:mecore/modules/bloc/weather_icon_cubit.dart';

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
          create: (context) => WeatherIconCubit(),
        ),
        BlocProvider(
          create: (context) => HalfHourColorCellsCubit(),
        ),
        BlocProvider(
          create: (context) => TextMarqueeCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: Locale('ja', ''),
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
