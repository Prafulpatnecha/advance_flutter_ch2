import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
        String sql = '''
        CREATE TABLE finance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        isIncome INTEGER NOT NULL,
        image TEXT,
        category TEXT
        );''';
        await db.execute(sql);
      },
    );
    return _db;
  }

  //TODO Read
  Future<List<Map<String, Object?>>> readData()
  async {
    Database? db = await database;
    String sql ='''
    SELECT * FROM finance
    ''';
    return await db!.rawQuery(sql);
  }

  //TODO Read
  Future<List<Map<String, Object?>>> readIncomeData(int isIncome)
  async {
    Database? db = await database;
    String sql ='''
    SELECT * FROM finance WHERE isIncome = ?
    ''';
    List args = [isIncome];
    return await db!.rawQuery(sql,args);
  }

  //Todo Insert
  Future<void> insertData(
      {required double amount,
      required double isIncome,
      required String category,required String image}) async {
    Database? db = await database;
    String sql = '''
    INSERT INTO finance(
    amount ,isIncome,category,image
    ) VALUES (?,?,?,?);
    ''';
    List args = [amount, isIncome, category,image];
    await db!.rawInsert(sql, args);
  }

  // TODO Delete
  Future<void> deleteData(int id) async {
    Database? db = await database;
    String sql = '''
    DELETE FROM finance
    WHERE id = ?;
    ''';
    List args = [id];
    await db!.rawDelete(sql, args);
  }

  //TODO update
  Future<void> updateData(int changeValue, int id, double amount,
      String category, int isIncome,String image) async {
    Database? db = await database;
    if (changeValue == 0) {
      String sql = '''
      UPDATE finance
      SET amount = ?
      WHERE id = ?;
      ''';
      List args = [amount,id];
      await db!.rawUpdate(sql, args);
    } else if (changeValue == 1) {
      String sql = '''
      UPDATE finance
      SET category = ?
      WHERE id = ?;
      ''';
      List args = [category,id];
      await db!.rawUpdate(
        sql,args
      );
    } else if (changeValue == 2) {
      String sql = '''
      UPDATE finance
      SET isIncome = ?
      WHERE id = ?;
      ''';
      List args = [isIncome,id];
      await db!.rawUpdate(sql, args);
    }
    else if(changeValue==3) {
      String sql = '''
      UPDATE finance
      SET amount = ?, category = ?, isIncome = ?, image = ?
      WHERE id = ?;
      ''';
      List args = [amount, category,isIncome,image,id];
      await db!.rawUpdate(sql, args);
    }
    else if(changeValue==4)
      {
        String sql = '''
        UPDATE finance
        SET image = ? WHERE id = ?;
        ''';
        List args=[image,id];
        await db!.rawUpdate(sql,args);
      }
  }
}
