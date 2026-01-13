import 'package:dartz/dartz.dart';
import 'package:flutter_session_jwt/flutter_session_jwt.dart';
import 'package:tazkar/core/utils/errors/failure.dart';
import 'package:tazkar/features/auth/data/source/auth_remote_data_source.dart';
import 'package:tazkar/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthRemoteDataSource remote;

  AuthRepoImp({required this.remote});

  @override
  Future<Result<Unit>> getOtp(String email) async {
    return await Failure.handleOperation<Unit>(
      operation: () => remote.getOtp(email),
      errorMessage: 'Failed to get OTP',
    );
  }

  @override
  Future<Result<Unit>> login(String email, String password) async {
    return await Failure.handleOperation<Unit>(
      operation: () async {
        final token = await remote.login(email, password);
        FlutterSessionJwt.saveToken(token);
        return unit;
      },
      errorMessage: 'Failed to login',
    );
  }

  @override
  Future<Result<Unit>> register(
      String name, String email, String password) async {
    return await Failure.handleOperation<Unit>(
      operation: () async {
        final token = await remote.register(name, email, password);
        FlutterSessionJwt.saveToken(token);
        return unit;
      },
      errorMessage: 'Failed to register',
    );
  }

  @override
  Future<Result<Unit>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> verifyOtp(String email, String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> changePassword(
      String email, String password, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> logout() async {
    return await Failure.handleOperation<Unit>(
      operation: () async {
        await FlutterSessionJwt.deleteToken();
        return unit;
      },
      errorMessage: 'Failed to register',
    );
  }
}
