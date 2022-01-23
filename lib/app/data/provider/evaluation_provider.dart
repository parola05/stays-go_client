import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stays_go/app/data/base_url.dart';
import 'package:stays_go/app/data/model/auth_model.dart';
import 'package:stays_go/app/data/model/error_model.dart';

class EvaluationApiClient {
  final http.Client httpClient = http.Client();
  final box = GetStorage("stays_go");

  Future<Map<String, dynamic>> makeEvaluation(
      codEstabelecimento, myUsername, classificacao, comentario) async {
    try {
      print("Pedindo ao servidor");
      Auth auth = Auth.fromJson(box.read("auth"));

      var data = {
        "codEstabelecimento": codEstabelecimento,
        "clienteUsername": myUsername,
        "classificacao": classificacao,
        "comentario": comentario
      };
      var body = json.encode(data);

      var response = await http.post(Uri.parse(baseUrl + "/avaliacoes"),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": auth.tokenType + " " + auth.token,
          },
          body: body);

      print("status code: " + response.statusCode.toString());
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

  Future<Map<String, dynamic>> getMyEvaluations() async {
    try {
      print("Pegar username da box");
      Auth auth = Auth.fromJson(box.read("auth"));

      var response = await http.get(
        Uri.parse(baseUrl +  '/avaliacoes?username=' + auth.username),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": auth.tokenType + " " + auth.token,
        },
      );

      print("status code: " + response.statusCode.toString());
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
