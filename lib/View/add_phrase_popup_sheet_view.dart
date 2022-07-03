import 'package:arashi/Controller/add_phrase_popup_sheet_controller.dart';
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
  late final AddPhrasePopupSheetController _controller;
  @override
  void initState() {
    _controller = AddPhrasePopupSheetController(widget.homeListViewKey);
    super.initState();
  }

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
        height: 150,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _controller.phraseTextFieldController,
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
