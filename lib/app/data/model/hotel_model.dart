import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stays_go/app/data/model/evaluation_model.dart';

class Hotel {
  late String hotelName;
  late String stars;
  late String preco;
  late String telefone;
  late String distancia;
  late String rua;
  late String codigoPostal;
  late String imagePath;
  late List<Evaluation> evaluations = <Evaluation>[];
  late LatLng latLng;

  Hotel(
      {required this.hotelName,
      required this.stars,
      required this.preco,
      required this.telefone,
      required this.distancia,
      required this.rua,
      required this.codigoPostal,
      required this.imagePath,
      required this.evaluations,
      required this.latLng});
}
