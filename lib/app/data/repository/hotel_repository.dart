import 'package:stays_go/app/data/model/hotel_model.dart';
import 'package:stays_go/app/data/model/success_model.dart';
import 'package:stays_go/app/data/provider/hotel_provider.dart';

class HotelRepository {
  final HotelApiClient apiClient = HotelApiClient();

  Future<List<Hotel>> getHoteisProximos(double lat, double lon) async {
    try {
      Map<String, dynamic> json = await apiClient.getHoteisProximos(lat, lon);
      List<Hotel> hoteisList = <Hotel>[];
      var hoteisJson = json["estabelecimentosProximos"];
      for (var hotel in hoteisJson) {
        hoteisList.add(Hotel.fromJson(hotel));
      }

      print("Quantidade de hoteis" + hoteisList.length.toString());
      return hoteisList;
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}
