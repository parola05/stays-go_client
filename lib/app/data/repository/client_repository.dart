import 'package:stays_go/app/data/model/success_model.dart';
import 'package:stays_go/app/data/provider/client_provider.dart';

class ClientRepository {
  final ClientApiClient apiClient = ClientApiClient();

  Future<String> updatePassword(String userName, String newPassword, String oldPassword) async {
    try {
      Map<String, dynamic> json = await apiClient.updatePassword(userName, newPassword, oldPassword);
      return Success.fromJson(json).successToString();
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<String> updateEmail(String userName, String newEmail, String oldEmail) async {
    try {
      Map<String, dynamic> json = await apiClient.updateEmail(userName, newEmail, oldEmail);
      return Success.fromJson(json).successToString();
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}
