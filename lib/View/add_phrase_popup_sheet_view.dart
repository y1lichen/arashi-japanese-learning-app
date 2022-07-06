import 'package:arashi/Controller/edit_phrase_data_controller.dart';
import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/View/HomePage/home_page_list_view.dart';
import 'package:flutter/material.dart';

class AddPhrasePopupSheetView extends StatefulWidget {
  const AddPhrasePopupSheetView(this.homeListViewKey, {Key? key})
      : super(key: key);
  final GlobalKey<HomePageListViewState> homeListViewKey;

  @override
  AddPhrasePopupSheetViewState createState() => AddPhrasePopupSheetViewState();
}

class AddPhrasePopupSheetViewState extends State<AddPhrasePopupSheetView> {
  late final EditPhraseDataController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = EditPhraseDataController(context);
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              PhraseDataModel? model = _controller.submitToInsert();
              if (model != null) {
                widget.homeListViewKey.currentState?.addData(model);
              }
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
        height: 150,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _controller.kanaTextFieldController,
                decoration: const InputDecoration(hintText: "Kana(仮名)"),
              ),
              TextFormField(
                controller: _controller.kanjiTextFieldController,
                decoration: const InputDecoration(hintText: "Kanji(漢字)"),
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
