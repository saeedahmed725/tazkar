part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationLoginSuccess extends AuthenticationState {}

final class AuthenticationRegisterSuccess extends AuthenticationState {}

final class AuthenticationRegisterError extends AuthenticationState {
  final Failure error;

  AuthenticationRegisterError(this.error);
}

final class AuthenticationLoginError extends AuthenticationState {
  final Failure message;

  AuthenticationLoginError(this.message);
}

final class AuthenticationChangePasswordError extends AuthenticationState {
  final Failure message;

  AuthenticationChangePasswordError(this.message);
}

final class OtpSent extends AuthenticationState {}

final class OtpVerified extends AuthenticationState {}

final class PasswordChanged extends AuthenticationState {}

final class PasswordReset extends AuthenticationState {}

final class AuthenticationLogoutSuccess extends AuthenticationState {}

final class AuthenticationLogoutError extends AuthenticationState {
  final Failure message;

  AuthenticationLogoutError(this.message);
}