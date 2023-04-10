part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  final bool show;

  const AuthLoading({required this.show});

  @override
  List<Object> get props => [show];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthSusses extends AuthState {
  final String message;

  const AuthSusses({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginSusses extends AuthState {
  final String message;

  const LoginSusses({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterSusses extends AuthState {
  final String message;

  const RegisterSusses({required this.message});

  @override
  List<Object> get props => [message];
}

class RememberCheck extends AuthState {
  final bool check;

  const RememberCheck({required this.check});

  @override
  List<Object> get props => [check];
}

class OtpCounter extends AuthState {
  final int time;

  const OtpCounter({required this.time});

  @override
  List<Object> get props => [time];
}
