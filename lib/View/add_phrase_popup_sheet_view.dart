import 'package:flutter/material.dart';
import 'package:arashi/Controller/add_phrase_popup_sheet_controller.dart';

class AddPhrasePopupSheetView extends StatefulWidget {
  const AddPhrasePopupSheetView({Key? key}) : super(key: key);

  @override
  AddPhrasePopupSheetViewState createState() => AddPhrasePopupSheetViewState();
}

class AddPhrasePopupSheetViewState extends State<AddPhrasePopupSheetView> {
  final _controller = AddPhrasePopupSheetViewController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setContext(context);
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              _controller.onSubmit();
            },
            child: const Text("add"))
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        height: 120,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _controller.phraseTextFieldController,
                decoration: const InputDecoration(hintText: "Phrase(Japanese)"),
              ),
              TextFormField(
                controller: _controller.meaningTextFieldController,
                decoration: const InputDecoration(hintText: "Meaning"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
