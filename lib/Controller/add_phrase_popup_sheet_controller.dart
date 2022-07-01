import 'package:flutter/cupertino.dart';

class AddPhrasePopupSheetViewController {
  late BuildContext _context;
  final _phraseTextFieldController = TextEditingController();
  final _meaningTextFieldController = TextEditingController();

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

  void onSubmit() {
    final regx = RegExp(
        r'[\u3000-\u303f\u3040-\u309f\u30a0-\u30ff\uff00-\uff9f\u4e00-\u9faf\u3400-\u4dbf]+');
    if (checkIsNotEmpty()) {
      if (regx.hasMatch(_phraseTextFieldController.text)) {
        debugPrint("is japanese");
      } else {
        _showAlertDialog("The phrase must be japanese!");
      }
    } else {
      _showAlertDialog("Phrase and meaning can't be empty!");
    }
  }
}
