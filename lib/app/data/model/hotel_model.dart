import 'package:google_maps_flutter/google_maps_flutter.dart';

class Hotel {
  late String codEstabelecimento;
  late String hotelName;
  late String stars;
  late String preco;
  late String telefone;
  late String distancia;
  late String rua;
  late String codigoPostal;
  late String imagePath;
  late int nEvaluations;
  late List<String> servicos = <String>[];
  late LatLng latLng;

  Hotel(
      {required this.codEstabelecimento,
      required this.hotelName,
      required this.stars,
      required this.preco,
      required this.telefone,
      required this.distancia,
      required this.rua,
      required this.codigoPostal,
      required this.imagePath,
      required this.servicos,
      required this.nEvaluations,
      required this.latLng});

  Hotel.fromJson(Map<String, dynamic> json) {
    codEstabelecimento = json['codEstabelecimento'].toString();
    hotelName = json['hotelName'];
    stars = json['stars'].toString();
    preco = json['preco'].toString();
    telefone = json['telefone'].toString();
    distancia = json['distancia'].toString();
    rua = json['rua'];
    codigoPostal = json['codigoPostal'];
    imagePath = json['imagePath'];
    nEvaluations = json['nEvaluations'];
    servicos = [];
    //servicos = json['servicos'];
    latLng = LatLng(json['latitude'], json['longitude']);
  }
}
