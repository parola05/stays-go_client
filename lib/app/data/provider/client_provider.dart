import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stays_go/app/data/base_url.dart';
import 'package:stays_go/app/data/model/auth_model.dart';
import 'package:stays_go/app/data/model/error_model.dart';

class ClientApiClient {
  final http.Client httpClient = http.Client();
  final box = GetStorage("stays_go");

  Future<Map<String, dynamic>> updatePassword(
      String username, String newPassword, String oldPassword) async {
    try {
      Auth auth = Auth.fromJson(box.read("auth"));
      var data = {"username": username, "newPassword": newPassword, "oldPassword":oldPassword};
      var body = json.encode(data);

      print("cheguei1");
      var response = await http.put(Uri.parse(baseUrl + "/clientes"),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": auth.tokenType + " " + auth.token,
          },
          body: body);

      print("cheguei2");
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

  Future<Map<String, dynamic>> updateEmail(
      String username, String newEmail, String oldEmail) async {
    try {
      Auth auth = Auth.fromJson(box.read("auth"));
      var data = {"username": username, "newEmail": newEmail, "oldEmail": oldEmail};
      var body = json.encode(data);

      var response = await http.put(Uri.parse(baseUrl + "/clientes"),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": auth.tokenType + " " + auth.token,
          },
          body: body);

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
