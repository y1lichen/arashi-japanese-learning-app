import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/Utils/phrase_data_db.dart';
import 'package:flutter/widgets.dart';

class PracticeViewController {
  static PageController pageController = PageController(initialPage: 0);

  static void goNextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 250), curve: Curves.easeInExpo);
  }

  static Future<List<PhraseDataModel>> getData() {
    return PhraseDataDB.getAllPhrases();
  }
}
