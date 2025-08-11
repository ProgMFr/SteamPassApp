import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:steampass/blocs/add_game/addgame_cubit.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/core/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steampass/presentation/homa_page.dart';
import 'package:steampass/utils/themes/dark_theme.dart';
import 'package:steampass/utils/themes/light_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();
  await Window.initialize();
  WindowManager.instance.ensureInitialized();
  await WindowManager.instance.setTitle("SteamPass");
  await WindowManager.instance.setHasShadow(true);
  await WindowManager.instance.setResizable(true);
  await WindowManager.instance.setMaximizable(true);

  await WindowManager.instance.setMinimumSize(const Size(800, 600));
  await WindowManager.instance.setIcon('assets/app_logo.png');
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => AddGameCubit()),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return FluentApp(
            title: "SteamPass",
            localizationsDelegates: [
              AppLocalizations.delegate, // Generated
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: AppLocalizations.supportedLocales,
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,

            home: HomePage(),
            locale: Locale(state.language),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
