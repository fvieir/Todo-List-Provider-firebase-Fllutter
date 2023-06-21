import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart' as p;

class SqliteConnectionFactory {
  Database? _db;
  final _lock = Lock();

  static const _VERSION = 1;
  static const _DATABASE_NAME = 'TODO_LIST_PROVIDER';
  static SqliteConnectionFactory? _instance;

  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();

    return _instance!;
  }

  Future<Database?> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = p.join(databasePath, _DATABASE_NAME);

    if (_db == null) {
      await _lock.synchronized(() async {
        _db ??= await openDatabase(
          databasePathFinal,
          version: _VERSION,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDowngrade,
        );
      });
    }
    return _db;
  }

  Future<void> close() async {
    await _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db) async {}

  Future<void> _onCreate(Database db, int version) async {}

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<void> _onDowngrade(
      Database db, int oldVersion, int newVersion) async {}
}
