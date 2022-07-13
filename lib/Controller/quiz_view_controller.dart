import 'package:flutter_tts/flutter_tts.dart';

class QuizViewController {
  late FlutterTts flutterTts;

  QuizViewController() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage("ja-JP");
    flutterTts.setSpeechRate(0.25);
  }

  void speak(String text) {
    flutterTts.speak(text);
  }
}
