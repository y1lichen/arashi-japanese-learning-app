import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/Utils/phrase_data_db.dart';
import 'package:arashi/View/HomePage/home_page_list_view.dart';
import 'package:flutter/cupertino.dart';

class AddPhrasePopupSheetController {
  late final BuildContext _context;
  final _phraseTextFieldController = TextEditingController();
  final _meaningTextFieldController = TextEditingController();
  late final GlobalKey<HomePageListViewState> _homeListViewKey;

  AddPhrasePopupSheetController(
      GlobalKey<HomePageListViewState> homeListViewKey) {
    _homeListViewKey = homeListViewKey;
  }

  TextEditingController get phraseTextFieldController {
    return _phraseTextFieldController;
  }

  TextEditingController get meaningTextFieldController {
    return _meaningTextFieldController;
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  void dispose() {
    _phraseTextFieldController.dispose();
    _meaningTextFieldController.dispose();
  }

  bool checkIsNotEmpty() {
    return (_phraseTextFieldController.text.isNotEmpty &&
        _meaningTextFieldController.text.isNotEmpty);
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

  void onSubmit() async {
    final regx = RegExp(
        r'[\u3000-\u303f\u3040-\u309f\u30a0-\u30ff\uff00-\uff9f\u4e00-\u9faf\u3400-\u4dbf]+');
    if (checkIsNotEmpty()) {
      if (regx.hasMatch(_phraseTextFieldController.text)) {
        PhraseDataModel model = PhraseDataModel(
            phrase: _phraseTextFieldController.text,
            meaning: _meaningTextFieldController.text);
        PhraseDataDB.insertPhrase(model);
        // add data in view
        _homeListViewKey.currentState?.addData(model);
        Navigator.of(_context).pop();
      } else {
        _showAlertDialog("The phrase must be japanese!");
      }
    } else {
      _showAlertDialog("Phrase and meaning can't be empty!");
    }
  }
}
