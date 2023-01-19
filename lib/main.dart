import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'app/theme.dart';
import 'data/cubits/Local/local_cubit.dart';
import 'data/cubits/annoucements/annoucements_cubit.dart';
import 'data/cubits/debug/app_bloc_observer.dart';
import 'data/cubits/login/login_cubit.dart';
import 'data/cubits/quizes/quizes_cubit.dart';
import 'helpers/AppLocalizations.dart';
import 'helpers/CacheHelper.dart';
import 'presentation/Dashboard/DashboardScreen.dart';
import 'presentation/Loginscreen/LoginScreen.dart';
import 'responsive/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalCubit()..getSavedLanguage()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => QuizesCubit()..getQuizes()),
        BlocProvider(
            create: (context) => AnnoucementsCubit()..getAnnoucements()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return MaterialApp(
              builder: (context, child) {
                child = ResponsiveWrapper.builder(
                  BouncingScrollWrapper.builder(context, child!),
                  // maxWidth: 1200,
                  minWidth: 450,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(450, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    const ResponsiveBreakpoint.autoScale(
                      1000,
                      name: TABLET,
                    ),
                    const ResponsiveBreakpoint.autoScale(2460, name: DESKTOP),
                    const ResponsiveBreakpoint.resize(2460, name: "4K"),
                  ],
                );

                return child;
              },
              debugShowCheckedModeBanner: false,
              locale:
                  state is ChangeLocaleState ? state.local : const Locale('en'),
              // const Locale('ar'),
              supportedLocales: const [
                Locale('en'),
                Locale('ar')
              ], //Localization
              localizationsDelegates: const [
                AppLocalizations
                    .delegate, // Localization basedon mobile defaulte language
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              title: 'Flutter Demo',
              theme: myTheme,
              routes: const {
                // '/': (context) => const LogIn(),
              },
              home: const ResponsiveLayout(
                  desktopBody: LoginScreen(),
                  tabletBody: LoginScreen(),
                  mobileBody: DashboardScreen()));
        },
      ),
    );
  }
}
