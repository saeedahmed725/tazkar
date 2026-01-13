import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/auth/domain/repo/auth_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepo authRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthenticationBloc(this.authRepo) : super(AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final result =
          await authRepo.login(emailController.text, passwordController.text);
      result.fold(
        (error) => emit(AuthenticationLoginError(error)),
        (unit) => emit(AuthenticationLoginSuccess()),
      );
    });
    on<RegisterEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await authRepo.register(
          nameController.text, emailController.text, passwordController.text);
      result.fold(
        (error) => emit(AuthenticationRegisterError(error)),
        (unit) => emit(AuthenticationLoginSuccess()),
      );
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await authRepo.changePassword(emailController.text,
          passwordController.text, newPasswordController.text);
      result.fold(
        (error) => emit(AuthenticationChangePasswordError(error)),
        (unit) => emit(PasswordChanged()),
      );
    });
    on<GetOtpEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await authRepo.getOtp(emailController.text);
      result.fold(
        (error) => emit(AuthenticationLoginError(error)),
        (unit) => emit(AuthenticationLoginSuccess()),
      );
    });
    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final result =
          await authRepo.verifyOtp(emailController.text, otpController.text);
      result.fold(
        (error) => emit(AuthenticationLoginError(error)),
        (unit) => emit(AuthenticationLoginSuccess()),
      );
    });
    on<LogoutEvent>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await authRepo.logout();
      result.fold(
        (error) => emit(AuthenticationLogoutError(error)),
        (unit) => emit(AuthenticationLogoutSuccess()),
      );
    });
  }
}
