import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/src/core/preferences/PreferencesHelper.dart';
import 'package:untitled/src/core/preferences/Prefs.dart';
import 'package:untitled/src/generated/l10n.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final confirmController = TextEditingController();
  final passwordController = TextEditingController();
  final pinController = TextEditingController();
  final oldPasswordController = TextEditingController();
  Prefs prefs = GetIt.instance.get<Prefs>();

  bool rememberCheckedValue = false;
  Timer? countdownTimer;
  int duration = 30;
  final FirebaseAuth _firebaseAuth = GetIt.instance.get<FirebaseAuth>();

  AuthCubit() : super(AuthInitial());

  void authInitial() async {
    await prefs.isRememberBool.then((value) => rememberCheckedValue = value);
    if (rememberCheckedValue) {
      await prefs.emailString.then((value) => emailController.text = value);
      await prefs.passwordString
          .then((value) => passwordController.text = value);
    }
  }

  void changeRemember() {
    rememberCheckedValue = !rememberCheckedValue;
    emit(RememberCheck(check: rememberCheckedValue));
  }

  Future<void> login() async {
    emit(const AuthLoading(show: true));
    try {
      final cardinal = await _firebaseAuth.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);

      User? user = cardinal.user;
      if (user != null) {
        if (user.emailVerified) {
          prefs.setRememberBool(rememberCheckedValue);
          prefs.setEmailString(emailController.value.text);
          prefs.setNameString(user.displayName ?? "");
          prefs.setPasswordString(passwordController.value.text);
          prefs.setIsLoginBool(true);
          emit(const LoginSusses(message: "You Are Logged"));
        } else {
          user.sendEmailVerification();
          emit(AuthError(
              message: S.current.verify_email));
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        emit(AuthError(message: S.current.password_error));
      } else if (e.code == 'wrong-password') {
        emit(AuthError(message: S.current.wrong_password));
      } else if (e.code == 'user-not-found') {
        emit(AuthError(message: S.current.email_not_found));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
    emit(const AuthLoading(show: false));
  }

  Future<void> updatePassWord() async {
    emit(const AuthLoading(show: true));
    try {
      final cardinal = await _firebaseAuth.sendPasswordResetEmail(
          email: emailController.value.text);

      // emit(const LoginSusses(message: "You Are Logged"));
    } on FirebaseAuthException catch (e) {

    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
    emit(const AuthLoading(show: false));
  }

  Future<void> otp() async {
    emit(const AuthLoading(show: true));
    await Future.delayed(const Duration(seconds: 10));
    prefs?.setEmailString(emailController.value.text);
    prefs?.setNameString(nameController.value.text);
    prefs?.setPasswordString(passwordController.value.text);
    prefs?.setIsLoginBool(true);
    emit(const AuthLoading(show: false));
    emit(const LoginSusses(message: "You Are Logged"));
  }

  void register() async {
    emit(const AuthLoading(show: true));
    try {
      final cardinal = await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);
      User? user = cardinal.user;
      if (user != null) {
        user.updateDisplayName(nameController.value.text);
        user.sendEmailVerification();
        emit(RegisterSusses(message: S.current.register_susses));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError(message: S.current.password_error));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError(message: S.current.email_found));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }

    emit(const AuthLoading(show: false));
  }

  void otpFinishTimer() {
    duration = 0;
    emit(OtpCounter(time: duration));
  }

  void otpStartTimer() {
    duration = 30;
    emit(OtpCounter(time: duration));
  }
}
