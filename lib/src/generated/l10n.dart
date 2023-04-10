// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enter_email {
    return Intl.message(
      'Enter Email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enter_password {
    return Intl.message(
      'Enter Password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm Password`
  String get enter_confirm_password {
    return Intl.message(
      'Enter confirm Password',
      name: 'enter_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `remember me`
  String get remember_me {
    return Intl.message(
      'remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `don't have an account?`
  String get have_account {
    return Intl.message(
      'don\'t have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `forget password`
  String get forget_password {
    return Intl.message(
      'forget password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `sign up now!`
  String get sign_up_now {
    return Intl.message(
      'sign up now!',
      name: 'sign_up_now',
      desc: '',
      args: [],
    );
  }

  /// `sign up`
  String get sign_up {
    return Intl.message(
      'sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `enter name`
  String get enter_name {
    return Intl.message(
      'enter name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `already have account`
  String get already_have_account {
    return Intl.message(
      'already have account',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `login now!`
  String get login_now {
    return Intl.message(
      'login now!',
      name: 'login_now',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get verify_email {
    return Intl.message(
      'Verify your email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code we send to email`
  String get enter_verify_code {
    return Intl.message(
      'Enter verification code we send to email',
      name: 'enter_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend code in`
  String get resend_code_in {
    return Intl.message(
      'Resend code in',
      name: 'resend_code_in',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `verify`
  String get verify {
    return Intl.message(
      'verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Don't receive code`
  String get receive_code {
    return Intl.message(
      'Don\'t receive code',
      name: 'receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code Please`
  String get enter_code_plz {
    return Intl.message(
      'Enter Code Please',
      name: 'enter_code_plz',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `what you want to do today?`
  String get home_title {
    return Intl.message(
      'what you want to do today?',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `predict if you have covid-19 or not`
  String get home_select_1 {
    return Intl.message(
      'predict if you have covid-19 or not',
      name: 'home_select_1',
      desc: '',
      args: [],
    );
  }

  /// `Know the Basic medicines for Corona`
  String get home_select_2 {
    return Intl.message(
      'Know the Basic medicines for Corona',
      name: 'home_select_2',
      desc: '',
      args: [],
    );
  }

  /// `How to avoid covid-19?`
  String get home_select_3 {
    return Intl.message(
      'How to avoid covid-19?',
      name: 'home_select_3',
      desc: '',
      args: [],
    );
  }

  /// `By any way you want to get predict if you have covid-19 or not`
  String get test_title {
    return Intl.message(
      'By any way you want to get predict if you have covid-19 or not',
      name: 'test_title',
      desc: '',
      args: [],
    );
  }

  /// `By some questions`
  String get test_select_1 {
    return Intl.message(
      'By some questions',
      name: 'test_select_1',
      desc: '',
      args: [],
    );
  }

  /// `By insert X-ray picture`
  String get test_select_2 {
    return Intl.message(
      'By insert X-ray picture',
      name: 'test_select_2',
      desc: '',
      args: [],
    );
  }

  /// `\nBy both some questions & insert X-ray photo\n`
  String get test_select_3 {
    return Intl.message(
      '\nBy both some questions & insert X-ray photo\n',
      name: 'test_select_3',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personal_info {
    return Intl.message(
      'Personal information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_pass {
    return Intl.message(
      'Change Password',
      name: 'change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Them`
  String get change_them {
    return Intl.message(
      'Change Them',
      name: 'change_them',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit {
    return Intl.message(
      'Edit profile',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save {
    return Intl.message(
      'Save Changes',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `old password`
  String get old_paa {
    return Intl.message(
      'old password',
      name: 'old_paa',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Done , Check Your Email To Active Account`
  String get register_susses {
    return Intl.message(
      'Your Account Done , Check Your Email To Active Account',
      name: 'register_susses',
      desc: '',
      args: [],
    );
  }

  /// `Please Verify Your Email From Link Send To You.`
  String get register_verify {
    return Intl.message(
      'Please Verify Your Email From Link Send To You.',
      name: 'register_verify',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get password_error {
    return Intl.message(
      'The password provided is too weak.',
      name: 'password_error',
      desc: '',
      args: [],
    );
  }

  /// `Your Password is Wrong .`
  String get wrong_password {
    return Intl.message(
      'Your Password is Wrong .',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Your Email Not Found.`
  String get email_not_found {
    return Intl.message(
      'Your Email Not Found.',
      name: 'email_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get email_found {
    return Intl.message(
      'The account already exists for that email.',
      name: 'email_found',
      desc: '',
      args: [],
    );
  }

  /// `Your Password Is Updated.`
  String get pass_updated {
    return Intl.message(
      'Your Password Is Updated.',
      name: 'pass_updated',
      desc: '',
      args: [],
    );
  }

  /// `Your Name Is Updated.`
  String get name_updated {
    return Intl.message(
      'Your Name Is Updated.',
      name: 'name_updated',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
