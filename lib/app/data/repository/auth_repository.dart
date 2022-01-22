import 'dart:ffi';

import 'package:stays_go/app/data/model/auth_model.dart';
import 'package:stays_go/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String userName, String password) async {
    try {
      Map<String, dynamic> json = await apiClient.login(userName, password);
      return Auth.fromJson(json);
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<Void?> register(String userName, String password, String email) async {
    try {
      Map<String, dynamic> json =
          await apiClient.register(userName, password, email);
      return null;
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}
