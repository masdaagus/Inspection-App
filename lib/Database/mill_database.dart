import 'package:Inspection/models/mill.dart';
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class MillDatabase {
  static final MillDatabase instance = MillDatabase.init();
  MillDatabase.init();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('mill.db');

    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // await db.execute('''
    //   CREATE TABLE $tableMill(
    //     ${MillFields.id} $idType,
    //     ${MillFields.lineSatu},
    //     ${MillFields.lineDua}
    //   )
    // ''');

    // Membuat table batch
    Batch batch = db.batch();

    batch.execute(''' 
      CREATE TABLE $tableMill(
        ${MillFields.id} $idType,
        ${MillFields.lineSatu},
        ${MillFields.lineDua}
      )   
    ''');

    print("Database has create");
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
