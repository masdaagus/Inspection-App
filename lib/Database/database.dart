import 'package:Inspection/pages/packer/models/packer_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_packer.dart';
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
    packerTable(db);
    // millTable(db);
    userTable(db);
  }

  // Functuion add to database
  Future<void> create({String table, Map<String, Object> object}) async {
    final db = await instance.database;
    db.insert(table, object);
  }

  // Read List Mill
  // Future<List> readAllMill() async {
  //   final db = await instance.database;

  //   final orderBy = '${MillFields.time} DESC';

  //   final result = await db.query(tableMill, orderBy: orderBy);

  //   return result.map((json) => Mill.fromJson(json)).toList();
  // }

  // Read List Packer
  Future<List> readAllPacker() async {
    final db = await instance.database;

    final orderBy = '${PackerFields.time} DESC';

    final result = await db.query(tablePacker, orderBy: orderBy);

    return result.map((json) => Packer.fromJson(json)).toList();
  }
}
