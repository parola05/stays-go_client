import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stays_go/app/data/base_url.dart';
import 'package:stays_go/app/data/model/error_model.dart';

class AuthApiClient {
  final http.Client httpClient = http.Client();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var data = {"username": username, "password": password};
      var body = json.encode(data);

      var response = await http.post(Uri.parse(baseUrl + "/login"),
          headers: {'Content-Type': 'application/json'}, body: body);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        Erro error = Erro.fromJson(json.decode(response.body));
        return Future.error(error.errorToString());
      }
    } catch (error) {
      return Future.error("Não foi possível conectar-se ao servidor");
    }
  }

  Future<Map<String, dynamic>> register(
      String username, String password, String email) async {
    try {
      var data = {"username": username, "password": password, "email": email};
      var body = json.encode(data);

      var response = await http.post(
        Uri.parse(baseUrl + "/register"),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        Erro error = Erro.fromJson(json.decode(response.body));
        return Future.error(error.errorToString());
      }
    } catch (error) {
      return Future.error("Não foi possível conectar-se ao servidor");
    }
  }
}
