import 'package:stays_go/app/data/model/success_model.dart';
import 'package:stays_go/app/data/provider/evaluation_provider.dart';

class EvaluationRepository {
  final EvaluationApiClient apiClient = EvaluationApiClient();

  Future<String> makeEvaluation(
      codEstabelecimento, myUsername, classificacao, comentario) async {
    try {
      Map<String, dynamic> json = await apiClient.makeEvaluation(
          codEstabelecimento, myUsername, classificacao, comentario
      );
      return Success.fromJson(json).successToString();
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}
