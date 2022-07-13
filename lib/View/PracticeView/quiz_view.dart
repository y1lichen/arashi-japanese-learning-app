import 'package:arashi/Controller/quiz_view_controller.dart';
import 'package:arashi/Model/phrase_data_model.dart';
import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  final PhraseDataModel model;
  const QuizView({Key? key, required this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizViewSate();
}

class _QuizViewSate extends State<QuizView> {
  bool _showHint = false;
  bool _hasKanji = false;
  final QuizViewController _controller = QuizViewController();

  void toggleShowHint() {
    setState(() {
      _showHint = !_showHint;
    });
  }

  @override
  void initState() {
    if (widget.model.kanji!.isNotEmpty) {
      _hasKanji = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PhraseDataModel model = widget.model;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(children: [
                  Text(
                    _hasKanji ? model.kanji! : model.kana,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        _controller
                            .speak(_hasKanji ? model.kanji! : model.kana);
                      },
                      icon: const Icon(
                        Icons.volume_up,
                        size: 20,
                        color: Colors.grey,
                      ))
                ])),
            const Spacer(),
            if (_hasKanji)
              TextButton(
                  onPressed: () => toggleShowHint(),
                  child: const Text("show hint")),
          ],
        ),
        const Divider(),
        if (_showHint)
          Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                model.kana,
                style: const TextStyle(fontSize: 25),
              )),
        Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                      child: const Icon(
                        Icons.mic,
                        size: 40,
                      ),
                    ))))
      ],
    );
  }
}
