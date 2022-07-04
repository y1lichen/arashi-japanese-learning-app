import 'package:arashi/Controller/edit_phrase_data_controller.dart';
import 'package:arashi/Model/phrase_data_model.dart';
import 'package:flutter/material.dart';

class EditListItemView extends StatefulWidget {
  final PhraseDataModel model;
  const EditListItemView({Key? key, required this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditListItemViewState();
}

class _EditListItemViewState extends State<EditListItemView> {
  late EditPhraseDataController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = EditPhraseDataController(context);
    _controller.setTextOfKanaTextField(widget.model.kana);
    _controller.setTextOfKanjiTextField(widget.model.kanji ?? "");
    _controller.setTextOfMeaningTextField(widget.model.meaning);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
              onPressed: () {
                _controller.submitToUpdate(widget.model);
              },
              style: TextButton.styleFrom(primary: Colors.white),
              child: const Text("Save"))
        ],
      ),
      body: Center(
        child: Form(
            child: Column(
          children: [
            ListTile(
              title: TextField(
                decoration: const InputDecoration(hintText: "Kana(仮名)"),
                controller: _controller.kanaTextFieldController,
              ),
            ),
            ListTile(
              title: TextField(
                decoration: const InputDecoration(hintText: "Kanji(漢字)"),
                controller: _controller.kanjiTextFieldController,
              ),
            ),
            ListTile(
              title: TextField(
                decoration: const InputDecoration(hintText: "Meaning"),
                controller: _controller.meaningTextFieldController,
              ),
            )
          ],
        )),
      ),
    );
  }
}
