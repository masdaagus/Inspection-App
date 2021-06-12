import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:Inspection/model_database/check_model.dart';

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
    final textType = 'text not null';

    Batch batch = db.batch();

    batch.execute('''
      create table $tableCheck(
         ${MillFields.id} $idType,
         ${MillFields.line} $boolType,
         ${MillFields.time} $textType,

         ${MillFields.bf07} $boolType,
         ${MillFields.fn07} $boolType,
         ${MillFields.bf08} $boolType,
         ${MillFields.fn08} $boolType,
         ${MillFields.bf09} $boolType,
         ${MillFields.fn09} $boolType,
         ${MillFields.bf10} $boolType,
         ${MillFields.fn10} $boolType,
         ${MillFields.ng01} $boolType,
         ${MillFields.ng02} $boolType,
         ${MillFields.ng03} $boolType,
         ${MillFields.ng04} $boolType,
         ${MillFields.wf01} $boolType,
         ${MillFields.wf02} $boolType,
         ${MillFields.wf03} $boolType,
         ${MillFields.wf04} $boolType,
         ${MillFields.bc01} $boolType,
         ${MillFields.bc02} $boolType,
         ${MillFields.bf02} $boolType,
         ${MillFields.fn02} $boolType,
         ${MillFields.bf03} $boolType,
         ${MillFields.fn03} $boolType,
         ${MillFields.bf04} $boolType,
         ${MillFields.fn04} $boolType,
         ${MillFields.bf05} $boolType,
         ${MillFields.fn05} $boolType,
         ${MillFields.bf06} $boolType,
         ${MillFields.fn06} $boolType,
         ${MillFields.sc01} $boolType,
         ${MillFields.sc02} $boolType,
         ${MillFields.sc03} $boolType,
         ${MillFields.be01} $boolType,
         ${MillFields.bm01} $boolType,
         ${MillFields.lq01} $boolType,
         ${MillFields.lq02} $boolType,
         ${MillFields.sr01} $boolType,
         ${MillFields.bf01} $boolType,
         ${MillFields.fn01} $boolType,
         ${MillFields.rf01} $boolType,

         ${MillFields.description_bf07} $textType,
         ${MillFields.description_fn07} $textType,
         ${MillFields.description_bf08} $textType,
         ${MillFields.description_fn08} $textType,
         ${MillFields.description_bf09} $textType,
         ${MillFields.description_fn09} $textType,
         ${MillFields.description_bf10} $textType,
         ${MillFields.description_fn10} $textType,
         ${MillFields.description_ng01} $textType,
         ${MillFields.description_ng02} $textType,
         ${MillFields.description_ng03} $textType,
         ${MillFields.description_ng04} $textType,
         ${MillFields.description_wf01} $textType,
         ${MillFields.description_wf02} $textType,
         ${MillFields.description_wf03} $textType,
         ${MillFields.description_wf04} $textType,
         ${MillFields.description_bc01} $textType,
         ${MillFields.description_bc02} $textType,
         ${MillFields.description_bf02} $textType,
         ${MillFields.description_fn02} $textType,
         ${MillFields.description_bf03} $textType,
         ${MillFields.description_fn03} $textType,
         ${MillFields.description_bf04} $textType,
         ${MillFields.description_fn04} $textType,
         ${MillFields.description_bf05} $textType,
         ${MillFields.description_fn05} $textType,
         ${MillFields.description_bf06} $textType,
         ${MillFields.description_fn06} $textType,
         ${MillFields.description_sc01} $textType,
         ${MillFields.description_sc02} $textType,
         ${MillFields.description_sc03} $textType,
         ${MillFields.description_be01} $textType,
         ${MillFields.description_bm01} $textType,
         ${MillFields.description_lq01} $textType,
         ${MillFields.description_lq02} $textType,
         ${MillFields.description_sr01} $textType,
         ${MillFields.description_bf01} $textType,
         ${MillFields.description_fn01} $textType,
         ${MillFields.description_rf01} $textType)
    ''');

    batch.commit();
  }

  Future<void> create({String table, Map<String, Object> mill}) async {
    final db = await instance.database;
    Batch batch = db.batch();
    batch.insert(table, mill);

    batch.commit(noResult: true);
  }

  Future readMill(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCheck,
      columns: MillFields.values,
      where: '${MillFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Check.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${MillFields.time} ASC';

    final result = await db.query(tableCheck, orderBy: orderBy);

    return result.map((json) => Check.fromJson(json)).toList();
  }
}
