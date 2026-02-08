import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class AppDb {
  AppDb._();
  static final AppDb instance = AppDb._();

  Database? _db;

  Future<Database> get database async {
    final existing = _db;
    if (existing != null) return existing;

    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, 'mydu.db');

    _db = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await _createTables(db);
      },
      onOpen: (db) async {
        await _createTables(db); 
      },
    );

    return _db!;
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        last_login TEXT NOT NULL
      )
    ''');
  }

  Future<void> saveLogin(String email) async {
    final db = await database;
    await db.insert(
      'users',
      {
        'email': email,
        'last_login': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, Object?>>> getLastLogins({int limit = 3}) async {
    final db = await database;
    return db.query(
      'users',
      orderBy: 'id DESC',
      limit: limit,
    );
  }

  Future<void> clearUsers() async {
    final db = await database;
    await db.delete('users');
  }

  Future<void> addTestLogin() async {
    await saveLogin("test${DateTime.now().millisecondsSinceEpoch}@aitu.kz");
  }
}