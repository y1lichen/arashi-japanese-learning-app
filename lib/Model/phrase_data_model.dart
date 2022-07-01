class PhraseDataModel {
  final int id;
  final String phrase;
  final String meaning;
  PhraseDataModel(
      {required this.id, required this.phrase, required this.meaning});

  Map<String, dynamic> toMap() {
    return {'id': id, 'phrase': phrase, 'meaning': meaning};
  }

  PhraseDataModel fromMap(Map<String, dynamic> map) {
    return PhraseDataModel(
        id: map['id'], phrase: map['phrase'], meaning: map['meaning']);
  }
}
