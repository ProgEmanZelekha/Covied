// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:untitled/src/core/di/AppModule.dart' as _i10;
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart' as _i3;
import 'package:untitled/src/core/preferences/PreferencesHelper.dart' as _i9;
import 'package:untitled/src/feature/auth/data/data_sources/auth_api_service.dart'
    as _i8;
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AppRouter>(appModule.appRouter);
    gh.factory<_i4.AuthCubit>(() => _i4.AuthCubit());
    await gh.factoryAsync<_i5.Dio>(
      () => appModule.dio(),
      preResolve: true,
    );
    gh.singleton<_i6.FirebaseAuth>(appModule.firebaseAuth());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.AuthApiService>(
        () => appModule.getAuthService(gh<_i5.Dio>()));
    gh.factory<_i9.PreferencesHelper>(
        () => appModule.getPreferencesHelper(gh<_i7.SharedPreferences>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
