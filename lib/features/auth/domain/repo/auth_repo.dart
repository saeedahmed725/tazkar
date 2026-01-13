import 'package:dartz/dartz.dart';
import 'package:tazkar/core/utils/errors/failure.dart';

abstract class AuthRepo {
  Future<Result<Unit>> login(String email, String password);

  Future<Result<Unit>> register(String name, String email, String password);

  Future<Result<Unit>> getOtp(String email);

  Future<Result<Unit>> verifyOtp(String email, String otp);

  Future<Result<Unit>> resetPassword(String email);

  Future<Result<Unit>> changePassword(
      String email, String password, String newPassword);

  Future<Result<Unit>> logout();
}
