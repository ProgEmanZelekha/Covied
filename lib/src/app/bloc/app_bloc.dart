import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/preferences/Prefs.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final Prefs prefs;
  bool isLogin = false;
  String languageCode = "en";
  String modeThem = "light";

  String? name;

  String? email;

  String? phone;

  String? password;

  AppBloc(
      {required this.prefs,
      required this.modeThem,
      required this.languageCode,
      required this.isLogin})
      : super(AppInitial(languageCode, modeThem)) {
    on<InitEvent>(_init);
    on<LogoutEvent>(_logout);
    on<LanguageEvent>(_changeLanguage);
    on<ThemEvent>(_changeThem);
  }

  void _init(InitEvent event, Emitter<AppState> emit) async {
    await prefs.isLoginBool.then((value) => isLogin = value);
    await prefs.languageString.then((value) {
      if (value.isNotEmpty) {
        languageCode = value;
      }
    });
    await prefs.phoneString.then((value) => phone = value);
    await prefs.themString.then((value) {
      if (value.isNotEmpty) {
        modeThem = value;
      }
    });
    if (isLogin) {
      getUserData();
    }
  }

  void getUserData() {
    prefs.nameString.then((value) => name = value);
    prefs.emailString.then((value) => email = value);
    prefs.passwordString.then((value) => password = value);
  }

  void _logout(LogoutEvent event, Emitter<AppState> emit) async {
    isLogin = event.isLogin;
    if (!event.isLogin) {
      emit(AppLogin(languageCode, modeThem, true));
      await prefs.clear();
      emit(AppLogin(languageCode, modeThem, false));
    }
  }

  void _changeLanguage(LanguageEvent event, Emitter<AppState> emit) async {
    languageCode = event.languageCode;
    await prefs.setLanguageString(event.languageCode);
    emit(ChangeSettings(languageCode, modeThem, isLogin));
  }

  void _changeThem(ThemEvent event, Emitter<AppState> emit) async {
    modeThem = event.them;
    await prefs.setThemString(event.them);
    emit(ChangeSettings(languageCode, modeThem, isLogin));
  }
}
