import 'package:Inspection/models/mill.dart';
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class MillDatabase {
  static final MillDatabase instance = MillDatabase.init();
  static final _databaseV1 = 1;
  MillDatabase.init();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB('mill.db');

    return _database;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    // return await openDatabase(path, version: 1, onCreate: _createDB);
    return await openDatabase(path, version: _databaseV1,
        onCreate: (db, version) async {
      Batch batch = db.batch();
      _createDB(batch);

      await batch.commit();
    });
  }

  void _createDB(Batch batch) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    batch.execute('''
      CREATE TABLE $tableMill(
        ${MillFields.id} $idType,
        ${MillFields.lineSatu},

      )    
    ''');
  }

  Future<Mill> create(Mill mill) async {
    final db = await instance.database;
    final id = await db.insert(tableMill, mill.toJson());
    return mill.copy(id: id);
  }

  Future<Mill> readMill(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableMill,
        columns: MillFields.values,
        where: '${MillFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Mill.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
}
