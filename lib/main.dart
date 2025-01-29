import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/navbar/bottom_navba_cubit.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/search/search_title_cubit.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_application_1/Features/Splash/presentation/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 22, 176, 182),
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchTitleCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavbarCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("fa", "IR"),
            ],
            locale: const Locale("fa", "IR"),
            theme: state.themeData,
            home: const Splash(),
          );
        },
      ),
    );
  }
}
