part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {


  LoginEvent();
}

class RegisterEvent extends AuthenticationEvent {

  RegisterEvent(
      );
}

class GetOtpEvent extends AuthenticationEvent {


  GetOtpEvent();
}

class VerifyOtpEvent extends AuthenticationEvent {


  VerifyOtpEvent();
}

class ResetPasswordEvent extends AuthenticationEvent {

  ResetPasswordEvent();
}

class ChangePasswordEvent extends AuthenticationEvent {


  ChangePasswordEvent(
     );
}

class LogoutEvent extends AuthenticationEvent {}

