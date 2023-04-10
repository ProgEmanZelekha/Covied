import 'package:untitled/src/core/preferences/PreferencesHelper.dart';
import 'package:untitled/src/core/preferences/constants.dart';

class Prefs {
  final PreferencesHelper preferencesHelper;

  Prefs(this.preferencesHelper);

  Future<String> get nameString => preferencesHelper.getString(name);

  Future setNameString(String value) =>
      preferencesHelper.setString(name, value);

  Future<String> get emailString => preferencesHelper.getString(email);

  Future setEmailString(String value) =>
      preferencesHelper.setString(email, value);

  Future<String> get phoneString => preferencesHelper.getString(phone);

  Future setPhoneString(String value) =>
      preferencesHelper.setString(phone, value);

  Future<String> get passwordString => preferencesHelper.getString(password);

  Future setPasswordString(String value) =>
      preferencesHelper.setString(password, value);

  Future<String> get languageString => preferencesHelper.getString(language);

  Future setLanguageString(String value) =>
      preferencesHelper.setString(language, value);

  Future<String> get themString => preferencesHelper.getString(them);

  Future setThemString(String value) =>
      preferencesHelper.setString(language, them);

  Future<bool> get isLoginBool => preferencesHelper.getBool(isLogin);

  Future setIsLoginBool(bool value) =>
      preferencesHelper.setBool(isLogin, value);

  Future<bool> get isRememberBool => preferencesHelper.getBool(remember);

  Future setRememberBool(bool value) =>
      preferencesHelper.setBool(remember, value);

  Future<void> clear() async {
    await Future.wait(<Future>[
      preferencesHelper.prefs.remove(name),
      preferencesHelper.prefs.remove(phone),
      preferencesHelper.prefs.remove(isLogin),
    ]);
  }
}
