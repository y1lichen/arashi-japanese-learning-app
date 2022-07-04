import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/Utils/phrase_data_db.dart';
import 'package:arashi/View/HomePage/home_page_list_view.dart';
import 'package:flutter/cupertino.dart';

class EditPhraseDataController {
  final BuildContext _context;
  final _kanaTextFieldController = TextEditingController();
  final _kanjiTextFieldController = TextEditingController();
  final _meaningTextFieldController = TextEditingController();
  late final GlobalKey<HomePageListViewState>? homeListViewKey;

  EditPhraseDataController(this._context, [this.homeListViewKey]);

  TextEditingController get kanaTextFieldController {
    return _kanaTextFieldController;
  }

  TextEditingController get kanjiTextFieldController {
    return _kanjiTextFieldController;
  }

  TextEditingController get meaningTextFieldController {
    return _meaningTextFieldController;
  }

  void dispose() {
    _kanaTextFieldController.dispose();
    _kanjiTextFieldController.dispose();
    _meaningTextFieldController.dispose();
  }

  void setTextOfKanaTextField(String text) {
    _kanaTextFieldController.text = text;
  }

  void setTextOfKanjiTextField(String text) {
    _kanjiTextFieldController.text = text;
  }

  void setTextOfMeaningTextField(String text) {
    _meaningTextFieldController.text = text;
  }

  bool checkIsEmpty() {
    return (_kanaTextFieldController.text.isEmpty ||
        _meaningTextFieldController.text.isEmpty);
  }

  void _showAlertDialog(String title) {
    showCupertinoDialog(
        context: _context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            actions: [
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  bool _isValid() {
    final regx = RegExp(
        r'[\u3000-\u303f\u3040-\u309f\u30a0-\u30ff\uff00-\uff9f\u4e00-\u9faf\u3400-\u4dbf]+');
    if (checkIsEmpty()) {
      _showAlertDialog("Kana and meaning can't be empty!");
      return false;
    }
    if (!(regx.hasMatch(_kanaTextFieldController.text) &&
        (regx.hasMatch(_kanjiTextFieldController.text) ||
            _kanjiTextFieldController.text == ""))) {
      _showAlertDialog("Kana and kanji must be japanese!");
      return false;
    }
    return true;
  }

  void submitToUpdate(PhraseDataModel originalModel) async {
    if (_isValid()) {
      PhraseDataModel newModel = PhraseDataModel(
          id: originalModel.id,
          kana: _kanaTextFieldController.text,
          kanji: _kanjiTextFieldController.text,
          meaning: _meaningTextFieldController.text,
          time: originalModel.time);
    }
  }

  void submitToInsert() async {
    if (_isValid()) {
      PhraseDataModel model = PhraseDataModel(
          kana: _kanaTextFieldController.text,
          kanji: _kanjiTextFieldController.text,
          meaning: _meaningTextFieldController.text);
      PhraseDataDB.insertPhrase(model);
      // add data in view
      homeListViewKey?.currentState?.addData(model);
      Navigator.of(_context).pop();
    }
  }
}
