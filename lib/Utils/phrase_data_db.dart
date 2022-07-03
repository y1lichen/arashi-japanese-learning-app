import 'package:arashi/Model/phrase_data_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PhraseDataDB {
  static Database? _database;
  static Future<Database> _initDb() async {
    return await openDatabase(
        join(await getDatabasesPath(),
            "japanese_learning.db"), // path of database
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE Phrases(id INTEGER PRIMARY KEY AUTOINCREMENT, phrase TEXT, meaning TEXT, time TEXT)");
    }, version: 1);
  }

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      return await _initDb();
    }
  }

  static Future<void> insertPhrase(PhraseDataModel phraseDataModel) async {
    final db = await database;
    await db.insert('Phrases', phraseDataModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<PhraseDataModel>> getAllPhrases() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Phrases');
    return List.generate(
        maps.length,
        (index) => PhraseDataModel(
            id: maps[index]['id'],
            phrase: maps[index]['phrase'],
            meaning: maps[index]['meaning'],
            time: maps[index]['time']));
  }

  static Future<void> updatePhrase(PhraseDataModel phraseDataModel) async {
    final db = await database;
    await db.update('Phrases', phraseDataModel.toMap(),
        where: 'id = ?', whereArgs: [phraseDataModel.id]);
  }

  static Future<void> deletePhrase(int id) async {
    final db = await database;
    await db.delete('Phrases', where: 'id = ?', whereArgs: [id]);
  }

  static void closePhraseDb() async {
    final db = await database;
    await db.close();
  }
}
