import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/app_themes.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/core/local/locale_constants.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/core/preferences/PreferencesHelper.dart';
import 'package:untitled/src/core/preferences/Prefs.dart';
import 'package:untitled/src/generated/l10n.dart';
import 'package:untitled/src/injector.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await Firebase.initializeApp();
  await configureDependencies();
  // await GetIt.instance.get<FirebaseAuth>().useAuthEmulator('localhost', 9099);

  runApp(BlocProvider<AppBloc>(
    create: (context) => AppBloc(
        prefs: prefs,
        modeThem: modeThem,
        languageCode: language,
        isLogin: login)
      ..add(InitEvent()),
    child: MyApp(isLogin: login),
  ));
}

late Prefs prefs;
var login = false;
var language = "en";
var modeThem = "light";

Future<void> init() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var preferencesHelper = PreferencesHelper(preferences);
  prefs = Prefs(preferencesHelper);
  await prefs.isLoginBool.then((value) => login = value);
  await prefs.languageString.then((value) {
    if (value.isNotEmpty) {
      language = value;
    }
  });
  await prefs.themString.then((value) {
    if (value.isNotEmpty) {
      modeThem = value;
    }
  });
}

Future<String> languageLocal() async {
  return await prefs.languageString.then((value) => value);
}

Future<String> themLocal() async {
  return await prefs.themString.then((value) => value);
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  MyApp({super.key, required this.isLogin});

  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    _appRouter.delegate(initialRoutes: [
      isLogin ? const HomeContainer() : const AuthContainer()
    ]);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        AppColors.of(context);
        return BlocBuilder<AppBloc, AppState>(
          // buildWhen: (ps, cs) => cs is LanguageCode ,
          builder: (context, state) {
            return MaterialApp.router(
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) =>
                      supportedLocales.contains(locale)
                          ? locale
                          : const Locale(LocaleConstants.defaultLocale),
              locale: Locale(state.languageCode ?? "en"),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              title: 'COVID',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode:
                  state.modeThem == "dark" ? ThemeMode.dark : ThemeMode.light,
              color: Colors.white,
            );
          },
        );
      },
    );
  }
}
