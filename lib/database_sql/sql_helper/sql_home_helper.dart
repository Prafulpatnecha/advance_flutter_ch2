import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();
  
  Database? _db;
  
  Future get database async => _db ?? await initDatabase();
  //Todo Create
  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "finance.db");
    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE finance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL ,
        isIncome INTEGER NOT NULL,
        category TEXT
        );''';
        await db.execute(sql);
      },
    );
    return _db;
  }
  //Todo Insert
  Future<void> insertData({required double amount,required double isIncome,required String category})
  async {
    Database? db = await database;
    String sql='''
    INSERT INTO finance(
    amount ,isIncome,category
    ) VALUES ($amount,$isIncome,"$category");
    ''';
    await db!.rawInsert(sql);
  }
  // TODO Delete
  Future<void> deleteData()
  async {
    Database? db = await database;
    String sql='''
    DELETE FROM finance
    ''';
    await db!.rawDelete(sql);
  }
}
