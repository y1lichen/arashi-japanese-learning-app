import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/Utils/phrase_data_db.dart';

class PracticeViewController {
  Future<List<PhraseDataModel>> data = PhraseDataDB.getAllPhrases();
}
