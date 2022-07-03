import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/Utils/phrase_data_db.dart';

class HomePageListViewController {
  Future<List<PhraseDataModel>> fetchData() {
    return PhraseDataDB.getAllPhrases();
  }

  static Future<List<PhraseDataModel>> appendElements(
      Future<List<PhraseDataModel>> appendedList,
      PhraseDataModel elementsToAdd) async {
    final list = await appendedList;
    list.addAll([elementsToAdd]);
    return list;
  }
}
