import 'dart:io';

import 'package:path/path.dart' as path_dart show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// database table and column names
const String tableWords = 'words';
const String columnId = '_id';
const String columnWord = 'word';
const String columnFrequency = 'frequency';

// data model class
class Word {
  late final int id;
  late final String word;
  late final int frequency;

  Word(this.id, this.word, this.frequency);

  // convenience constructor to create a Word object
  Word.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    word = map[columnWord];
    frequency = map[columnFrequency];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnWord: word, columnFrequency: frequency};
    map[columnId] = id;
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static const _databaseName = "MyDatabase.db";
  // Increment this version when you need to change the schema.
  static const _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = path_dart.join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableWords (
                $columnId INTEGER PRIMARY KEY,
                $columnWord TEXT NOT NULL,
                $columnFrequency INTEGER NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Word word) async {
    Database db = await database;
    int id = await db.insert(tableWords, word.toMap());
    return id;
  }

  Future<Word?> queryWord(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableWords,
        columns: [columnId, columnWord, columnFrequency],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Word.fromMap(maps.first);
    }
    return null;
  }

// TODO: queryAllWords()
// TODO: delete(int id)
// TODO: update(Word word)
}
