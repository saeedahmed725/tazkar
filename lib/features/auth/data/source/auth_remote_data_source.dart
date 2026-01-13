import 'package:tazkar/core/constants/app_apis.dart';
import 'package:tazkar/core/services/network_client.dart';

class AuthRemoteDataSource {
  final NetworkClient client;

  AuthRemoteDataSource({required this.client});

 Future<String> login(String email, String password) async {
    final response = await client.post(AppApis.baseUrl + AppApis.login,
        data: {'email': email, 'password': password});
    return response.data['access_token'];
  }

  Future<String>  register(String name, String email, String password) async {
    final response = await client.post(AppApis.baseUrl + AppApis.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
          "role": "user"
        });
    return response.data;
  }

  getOtp(String email) {}

  verifyOtp(String email, String otp) {}

  resetPassword(String email) {}

  Future<String>  changePassword(String email, String password, String newPassword) async {
    final response = await client.post(AppApis.baseUrl + AppApis.changePassword,
        data: {'email': email, 'password': password});
    return response.data;
  }
}
