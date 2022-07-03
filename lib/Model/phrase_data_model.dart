class PhraseDataModel {
  final int? id;
  final String kana;
  final String? kanji;
  final String meaning;
  final String? time;

  PhraseDataModel(
      {this.id,
      required this.kana,
      this.kanji,
      required this.meaning,
      this.time});

  Map<String, dynamic> toMap() {
    time ?? DateTime.now().toIso8601String();
    kanji ?? "";
    return {'kana': kana, 'kanji': kanji, 'meaning': meaning, 'time': time};
  }

  PhraseDataModel fromMap(Map<String, dynamic> map) {
    return PhraseDataModel(
        id: map['id'],
        kana: map['kana'],
        kanji: map['kanji'],
        meaning: map['meaning']);
  }
}
