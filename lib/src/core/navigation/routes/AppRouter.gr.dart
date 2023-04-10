// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;

import '../../../feature/auth/presentation/pages/forget_pass_page.dart' as _i11;
import '../../../feature/auth/presentation/pages/login_page.dart' as _i9;
import '../../../feature/auth/presentation/pages/otp_page.dart' as _i12;
import '../../../feature/auth/presentation/pages/register_page.dart' as _i10;
import '../../../feature/auth/presentation/widgets/auth_container.dart' as _i1;
import '../../../feature/home/presentation/pages/home_container.dart' as _i2;
import '../../../feature/home/presentation/pages/home_page.dart' as _i14;
import '../../../feature/home/presentation/pages/profile/about_us_page.dart'
    as _i4;
import '../../../feature/home/presentation/pages/profile/change_password_page.dart'
    as _i13;
import '../../../feature/home/presentation/pages/profile/contact_us_page.dart'
    as _i5;
import '../../../feature/home/presentation/pages/profile/edite_profile_page.dart'
    as _i18;
import '../../../feature/home/presentation/pages/profile/EmptyProfilePage.dart'
    as _i3;
import '../../../feature/home/presentation/pages/profile/profile_info_page.dart'
    as _i17;
import '../../../feature/home/presentation/pages/profile/settings_page.dart'
    as _i6;
import '../../../feature/home/presentation/pages/profile_page.dart' as _i16;
import '../../../feature/home/presentation/pages/question/question_page.dart'
    as _i7;
import '../../../feature/home/presentation/pages/question/question_result_page.dart'
    as _i8;
import '../../../feature/home/presentation/pages/test_page.dart' as _i15;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AuthContainer.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthContainer(),
      );
    },
    HomeContainer.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeContainer(),
      );
    },
    EmptyProfileRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyProfilePage(),
      );
    },
    AboutUsRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AboutUsPage(),
      );
    },
    ContactUsRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ContactUsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsPage(),
      );
    },
    QuestionRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionRouteArgs>(
          orElse: () => const QuestionRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.QuestionPage(key: args.key),
      );
    },
    QuestionResultRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.QuestionResultPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.LoginPage(key: args.key),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.RegisterPage(key: args.key),
      );
    },
    ForgetPassRoute.name: (routeData) {
      final args = routeData.argsAs<ForgetPassRouteArgs>(
          orElse: () => const ForgetPassRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.ForgetPassPage(key: args.key),
      );
    },
    OtpRoute.name: (routeData) {
      final args =
          routeData.argsAs<OtpRouteArgs>(orElse: () => const OtpRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.OtpPage(key: args.key),
      );
    },
    ResetPassword.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.ChangePasswordPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.HomePage(),
      );
    },
    TestRoute.name: (routeData) {
      final args =
          routeData.argsAs<TestRouteArgs>(orElse: () => const TestRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.TestPage(key: args.key),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    ProfileInfoRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ProfileInfoPage(),
      );
    },
    EditeProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditeProfileRouteArgs>(
          orElse: () => const EditeProfileRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.EditeProfilePage(key: args.key),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.ChangePasswordPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          AuthContainer.name,
          path: '/auth-container',
          children: [
            _i19.RouteConfig(
              LoginRoute.name,
              path: '',
              parent: AuthContainer.name,
            ),
            _i19.RouteConfig(
              RegisterRoute.name,
              path: 'register-page',
              parent: AuthContainer.name,
            ),
            _i19.RouteConfig(
              ForgetPassRoute.name,
              path: 'forget-pass-page',
              parent: AuthContainer.name,
            ),
            _i19.RouteConfig(
              OtpRoute.name,
              path: 'otp-page',
              parent: AuthContainer.name,
            ),
            _i19.RouteConfig(
              ResetPassword.name,
              path: 'change-password-page',
              parent: AuthContainer.name,
            ),
          ],
        ),
        _i19.RouteConfig(
          HomeContainer.name,
          path: '/home-container',
          children: [
            _i19.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: HomeContainer.name,
            ),
            _i19.RouteConfig(
              TestRoute.name,
              path: 'test-page',
              parent: HomeContainer.name,
            ),
            _i19.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: HomeContainer.name,
            ),
          ],
        ),
        _i19.RouteConfig(
          EmptyProfileRoute.name,
          path: '/empty-profile-page',
          children: [
            _i19.RouteConfig(
              ProfileInfoRoute.name,
              path: '',
              parent: EmptyProfileRoute.name,
            ),
            _i19.RouteConfig(
              EditeProfileRoute.name,
              path: 'edite-profile-page',
              parent: EmptyProfileRoute.name,
            ),
            _i19.RouteConfig(
              ChangePasswordRoute.name,
              path: 'change-password-page',
              parent: EmptyProfileRoute.name,
            ),
          ],
        ),
        _i19.RouteConfig(
          AboutUsRoute.name,
          path: '/about-us-page',
        ),
        _i19.RouteConfig(
          ContactUsRoute.name,
          path: '/contact-us-page',
        ),
        _i19.RouteConfig(
          SettingsRoute.name,
          path: '/',
        ),
        _i19.RouteConfig(
          QuestionRoute.name,
          path: '/question-page',
        ),
        _i19.RouteConfig(
          QuestionResultRoute.name,
          path: '/question-result-page',
        ),
      ];
}

/// generated route for
/// [_i1.AuthContainer]
class AuthContainer extends _i19.PageRouteInfo<void> {
  const AuthContainer({List<_i19.PageRouteInfo>? children})
      : super(
          AuthContainer.name,
          path: '/auth-container',
          initialChildren: children,
        );

  static const String name = 'AuthContainer';
}

/// generated route for
/// [_i2.HomeContainer]
class HomeContainer extends _i19.PageRouteInfo<void> {
  const HomeContainer({List<_i19.PageRouteInfo>? children})
      : super(
          HomeContainer.name,
          path: '/home-container',
          initialChildren: children,
        );

  static const String name = 'HomeContainer';
}

/// generated route for
/// [_i3.EmptyProfilePage]
class EmptyProfileRoute extends _i19.PageRouteInfo<void> {
  const EmptyProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EmptyProfileRoute.name,
          path: '/empty-profile-page',
          initialChildren: children,
        );

  static const String name = 'EmptyProfileRoute';
}

/// generated route for
/// [_i4.AboutUsPage]
class AboutUsRoute extends _i19.PageRouteInfo<void> {
  const AboutUsRoute()
      : super(
          AboutUsRoute.name,
          path: '/about-us-page',
        );

  static const String name = 'AboutUsRoute';
}

/// generated route for
/// [_i5.ContactUsPage]
class ContactUsRoute extends _i19.PageRouteInfo<void> {
  const ContactUsRoute()
      : super(
          ContactUsRoute.name,
          path: '/contact-us-page',
        );

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i19.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i7.QuestionPage]
class QuestionRoute extends _i19.PageRouteInfo<QuestionRouteArgs> {
  QuestionRoute({_i20.Key? key})
      : super(
          QuestionRoute.name,
          path: '/question-page',
          args: QuestionRouteArgs(key: key),
        );

  static const String name = 'QuestionRoute';
}

class QuestionRouteArgs {
  const QuestionRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'QuestionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.QuestionResultPage]
class QuestionResultRoute extends _i19.PageRouteInfo<void> {
  const QuestionResultRoute()
      : super(
          QuestionResultRoute.name,
          path: '/question-result-page',
        );

  static const String name = 'QuestionResultRoute';
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i20.Key? key})
      : super(
          LoginRoute.name,
          path: '',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.RegisterPage]
class RegisterRoute extends _i19.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i20.Key? key})
      : super(
          RegisterRoute.name,
          path: 'register-page',
          args: RegisterRouteArgs(key: key),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.ForgetPassPage]
class ForgetPassRoute extends _i19.PageRouteInfo<ForgetPassRouteArgs> {
  ForgetPassRoute({_i20.Key? key})
      : super(
          ForgetPassRoute.name,
          path: 'forget-pass-page',
          args: ForgetPassRouteArgs(key: key),
        );

  static const String name = 'ForgetPassRoute';
}

class ForgetPassRouteArgs {
  const ForgetPassRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'ForgetPassRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.OtpPage]
class OtpRoute extends _i19.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({_i20.Key? key})
      : super(
          OtpRoute.name,
          path: 'otp-page',
          args: OtpRouteArgs(key: key),
        );

  static const String name = 'OtpRoute';
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.ChangePasswordPage]
class ResetPassword extends _i19.PageRouteInfo<ResetPasswordArgs> {
  ResetPassword({
    _i20.Key? key,
    required int type,
  }) : super(
          ResetPassword.name,
          path: 'change-password-page',
          args: ResetPasswordArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'ResetPassword';
}

class ResetPasswordArgs {
  const ResetPasswordArgs({
    this.key,
    required this.type,
  });

  final _i20.Key? key;

  final int type;

  @override
  String toString() {
    return 'ResetPasswordArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i14.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i15.TestPage]
class TestRoute extends _i19.PageRouteInfo<TestRouteArgs> {
  TestRoute({_i20.Key? key})
      : super(
          TestRoute.name,
          path: 'test-page',
          args: TestRouteArgs(key: key),
        );

  static const String name = 'TestRoute';
}

class TestRouteArgs {
  const TestRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'TestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i17.ProfileInfoPage]
class ProfileInfoRoute extends _i19.PageRouteInfo<void> {
  const ProfileInfoRoute()
      : super(
          ProfileInfoRoute.name,
          path: '',
        );

  static const String name = 'ProfileInfoRoute';
}

/// generated route for
/// [_i18.EditeProfilePage]
class EditeProfileRoute extends _i19.PageRouteInfo<EditeProfileRouteArgs> {
  EditeProfileRoute({_i20.Key? key})
      : super(
          EditeProfileRoute.name,
          path: 'edite-profile-page',
          args: EditeProfileRouteArgs(key: key),
        );

  static const String name = 'EditeProfileRoute';
}

class EditeProfileRouteArgs {
  const EditeProfileRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'EditeProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.ChangePasswordPage]
class ChangePasswordRoute extends _i19.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    _i20.Key? key,
    required int type,
  }) : super(
          ChangePasswordRoute.name,
          path: 'change-password-page',
          args: ChangePasswordRouteArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'ChangePasswordRoute';
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({
    this.key,
    required this.type,
  });

  final _i20.Key? key;

  final int type;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key, type: $type}';
  }
}
