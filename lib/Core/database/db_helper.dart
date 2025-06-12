import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static final DBhelper _instance = DBhelper._internal();
  static Database? _database;

  factory DBhelper() {
    return _instance;
  }

  DBhelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();

    final path = join(dbPath, "kingWork.db");

    final exist = await databaseExists(path);

    if (!exist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data =
          await rootBundle.load(join("assets/database/", "kingWork.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return _openDatabase(path);
  }

  Future<Database> _openDatabase(String path) async {
    return openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getTafsir() async {
    final db = await database;
    return db.query(
      'topics',
    );
  }

  Future<List<Map<String, dynamic>>> getTafsirContent(int id) async {
    final db = await database;
    return db.query('topics', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> searchTitle(String keyword) async {
    final db = await database;
    return db.rawQuery(
      '''
    SELECT * 
    FROM topics 
    WHERE title LIKE ? OR Interpretation LIKE ? OR narrations LIKE ? OR stories LIKE ?
      ''',
      ['%$keyword%', '%$keyword%', '%$keyword%', '%$keyword%'],
    );
  }

  updateFav(int id, int fav) async {
    final db = await database;
    db.update('topics', {'fav': fav}, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getFavorite() async {
    final db = await database;
    return db.query(
      'topics',
      where: 'fav = ?',
      whereArgs: [1],
    );
  }

  Future<void> updateDownload(int id, int isDownload) async {
    final db = await database;

    await db.rawUpdate(
      'UPDATE books SET downloaded = ? WHERE id = ?',
      [isDownload, id],
    );
  }

  Future<void> deleteArticle({
    required int id,
  }) async {
    final db = await database;
    await db.delete("bookmark", where: "id = ?", whereArgs: [id]);
  }
}
