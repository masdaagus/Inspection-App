import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_user.dart';

class DatabaseMill {
  static final DatabaseMill instance = DatabaseMill.init();
  static final _databaseV1 = 1;
  static Database _database;
  DatabaseMill.init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('mill.db');

    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: _databaseV1, onCreate: _createDB);
  }
  /////////////////////////////////////////////////////////////////////////////////

  // Table Database
  Future _createDB(Database db, int version) async {
    userTable(db);
  }
}
