import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/Utils/phrase_data_db.dart';

class HomePageListViewController {
  static Future<List<PhraseDataModel>> fetchData() {
    return PhraseDataDB.getAllPhrases();
  }

  static Future<int> _getIndexById(
      Future<List<PhraseDataModel>> data, int id) async {
    final list = await data;
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        return i;
      }
    }
    return -1;
  }

  static Future<List<PhraseDataModel>> updateAndGetNewData(
      Future<List<PhraseDataModel>> data, PhraseDataModel newModel) async {
    final newData = await data;
    int index = await _getIndexById(data, newModel.id!);
    newData[index] = newModel;
    return newData;
  }

  static Future<List<PhraseDataModel>> deleteAndGetData(
      Future<List<PhraseDataModel>> data, PhraseDataModel dataToDelete) async {
    final newData = await data;
    PhraseDataDB.deletePhrase(dataToDelete.id!);
    int index = await _getIndexById(data, dataToDelete.id!);
    newData.removeAt(index);
    return newData;
  }

  static Future<List<PhraseDataModel>> appendElements(
      Future<List<PhraseDataModel>> appendedList,
      PhraseDataModel elementsToAdd) async {
    final list = await appendedList;
    list.add(elementsToAdd);
    return list;
  }
}
