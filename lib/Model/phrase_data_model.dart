class PhraseDataModel {
  final int? id;
  final String phrase;
  final String meaning;
  final String? time;

  PhraseDataModel(
      {this.id, required this.phrase, required this.meaning, this.time});

  Map<String, dynamic> toMap() {
    time ?? DateTime.now().toIso8601String();
    return {'phrase': phrase, 'meaning': meaning, 'time': time};
  }

  PhraseDataModel fromMap(Map<String, dynamic> map) {
    return PhraseDataModel(
        id: map['id'], phrase: map['phrase'], meaning: map['meaning']);
  }
}
