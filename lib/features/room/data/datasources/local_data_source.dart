import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Import the path package

class LocalDataSource {
  static const _dbName = 'app_database.db';
  static const _tableName = 'counter';
  static const _columnId = 'id';
  static const _columnValue = 'value';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath(); // Gets the database directory
    final path = join(dbPath, _dbName); // Joins the path and database name

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_columnValue INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> initializeTable() async {
    final db = await database;
    final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $_tableName'));
    if (count == 0) {
      await db.insert(_tableName, {_columnValue: 0});
    }
  }

  Future<int> fetchCounter() async {
    final db = await database;
    final result = await db.query(
      _tableName,
      columns: [_columnValue],
      where: '$_columnId = ?',
      whereArgs: [1],
    );
    return result.isNotEmpty ? result.first[_columnValue] as int : 0;
  }

  Future<void> saveCounter(int value) async {
    final db = await database;
    await db.update(
      _tableName,
      {_columnValue: value},
      where: '$_columnId = ?',
      whereArgs: [1],
    );
  }
}
