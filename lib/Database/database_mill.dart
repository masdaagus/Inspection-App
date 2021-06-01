import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:Inspection/models/mill_model.dart';

class DatabaseMill {
  static final DatabaseMill instance = DatabaseMill.init();
  static final _databaseV1 = 1;
  DatabaseMill.init();
  static Database _database;

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

  Future _createDB(Database db, int version) async {
    final idType = 'integer primary key autoincrement';
    final boolType = 'integer not null';

    Batch batch = db.batch();

    batch.execute('''
      create table $tableCheck(
        ${IsiMill.id} $idType,
         ${IsiMill.bf07} $boolType,
         ${IsiMill.fn07} $boolType,
         ${IsiMill.bf08} $boolType,
         ${IsiMill.fn08} $boolType,
         ${IsiMill.bf09} $boolType,
         ${IsiMill.fn09} $boolType,
         ${IsiMill.bf10} $boolType,
         ${IsiMill.fn10} $boolType,
         ${IsiMill.ng01} $boolType,
         ${IsiMill.ng02} $boolType,
         ${IsiMill.ng03} $boolType,
         ${IsiMill.ng04} $boolType,
         ${IsiMill.wf01} $boolType,
         ${IsiMill.wf02} $boolType,
         ${IsiMill.wf03} $boolType,
         ${IsiMill.wf04} $boolType,
         ${IsiMill.bc01} $boolType,
         ${IsiMill.bc02} $boolType,
         ${IsiMill.bf02} $boolType,
         ${IsiMill.fn02} $boolType,
         ${IsiMill.bf03} $boolType,
         ${IsiMill.fn03} $boolType,
         ${IsiMill.bf04} $boolType,
         ${IsiMill.fn04} $boolType,
         ${IsiMill.bf05} $boolType,
         ${IsiMill.fn05} $boolType,
         ${IsiMill.bf06} $boolType,
         ${IsiMill.fn06} $boolType,
         ${IsiMill.sc01} $boolType,
         ${IsiMill.sc02} $boolType,
         ${IsiMill.sc03} $boolType,
         ${IsiMill.be01} $boolType,
         ${IsiMill.bm01} $boolType,
         ${IsiMill.lq01} $boolType,
         ${IsiMill.lq02} $boolType,
         ${IsiMill.sr01} $boolType,
         ${IsiMill.bf01} $boolType,
         ${IsiMill.fn01} $boolType,
         ${IsiMill.rf01} $boolType)
    ''');

    batch.commit();
  }

  Future<void> create(Mill mill) async {
    final db = await instance.database;
    Batch batch = db.batch();
    batch.insert(tableCheck, mill.toJson());

    // final id = await batch.insert(tableCheck, mill.toJson());
    // return mill.copy(id: id);
    batch.commit(noResult: true);
    // var result = batch.commit();
    // print(result);
  }

  Future<Mill> readMill(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCheck,
      columns: IsiMill.values,
      where: '${IsiMill.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Mill.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Mill>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${IsiMill.id}';

    final result = await db.query(tableCheck, orderBy: orderBy);

    return result.map((json) => Mill.fromJson(json)).toList();
  }
}
