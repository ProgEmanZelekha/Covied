import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/core/network/logging_interceptor.dart';
import 'package:untitled/src/core/preferences/PreferencesHelper.dart';
import 'package:untitled/src/feature/auth/data/data_sources/auth_api_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Dio> dio() async => Dio()
    ..options.connectTimeout =
        const Duration(milliseconds: Duration.millisecondsPerMinute)
    ..options.receiveTimeout =
        const Duration(milliseconds: Duration.millisecondsPerMinute)
    ..options.validateStatus = (status) {
      return status! <= 500;
    }
    ..interceptors.add(LoggingInterceptor());

  @Singleton()
  FirebaseAuth firebaseAuth() => FirebaseAuth.instance;



  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  PreferencesHelper getPreferencesHelper(SharedPreferences prefs) =>
      PreferencesHelper(prefs);

  AuthApiService getAuthService(Dio dio) => AuthApiService(dio);

  @Singleton()
  AppRouter get appRouter => AppRouter();
}
