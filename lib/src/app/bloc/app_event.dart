part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class InitEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends AppEvent {
  final bool isLogin;

  const LogoutEvent({required this.isLogin});

  @override
  List<Object?> get props => [isLogin];
}

class LanguageEvent extends AppEvent {
  final String languageCode;

  const LanguageEvent({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}
class ThemEvent extends AppEvent {
  final String them;

  const ThemEvent({required this.them});

  @override
  List<Object?> get props => [them];
}
