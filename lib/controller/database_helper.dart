import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../model/news_history_model.dart';
 // Your NewsHistory model

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('news.db');
    return _database!;
  }

  // Open the database
  Future<Database> _initDB(String dbName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Create table
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE news_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        image TEXT,
        content TEXT
      )
    ''');
  }

  // Insert a news item
  Future<int> insert(NewsHistory newsHistory) async {
    final db = await instance.database;
    return await db.insert('news_history', newsHistory.toMap());
  }

  // Fetch history
  Future<List<NewsHistory>> getHistory() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('news_history');

    if (maps.isNotEmpty) {
      return maps.map((map) => NewsHistory.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  // Delete all records
  Future<int> deleteAll() async {
    final db = await instance.database;
    return await db.delete('news_history');
  }
}
