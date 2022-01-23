import 'package:stays_go/app/data/model/evaluation_model.dart';
import 'package:stays_go/app/data/model/success_model.dart';
import 'package:stays_go/app/data/provider/evaluation_provider.dart';

class EvaluationRepository {
  final EvaluationApiClient apiClient = EvaluationApiClient();

  Future<String> makeEvaluation(
      codEstabelecimento, myUsername, classificacao, comentario) async {
    try {
      Map<String, dynamic> json = await apiClient.makeEvaluation(
          codEstabelecimento, myUsername, classificacao, comentario);
      return Success.fromJson(json).successToString();
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<List<Evaluation>> getMyEvaluations() async {
    try {
      Map<String, dynamic> json = await apiClient.getMyEvaluations();

      List<Evaluation> evaluations = <Evaluation>[];
      var evaluationsJson = json["avaliacoes"];

      for (var evaluation in evaluationsJson) {
        evaluations.add(Evaluation.fromJson(evaluation));
      }

      print("Evaluations size:" + evaluations.length.toString());
      return evaluations;
    } catch (error) {
      return Future.error(error.toString());
    }
  }
  
  Future<List<Evaluation>> getHotelEvaluations(codHotel) async {
    try {
      Map<String, dynamic> json = await apiClient.getHotelEvaluations(codHotel);

      List<Evaluation> evaluations = <Evaluation>[];
      var evaluationsJson = json["avaliacoes"];

      for (var evaluation in evaluationsJson) {
        evaluations.add(Evaluation.fromJson(evaluation));
      }

      print("Evaluations size:" + evaluations.length.toString());
      return evaluations;
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}
