import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:Inspection/models/model_database/check_model.dart';

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
        ${CheckMill.id} $idType,
         ${CheckMill.bf07} $boolType,
         ${CheckMill.fn07} $boolType,
         ${CheckMill.bf08} $boolType,
         ${CheckMill.fn08} $boolType,
         ${CheckMill.bf09} $boolType,
         ${CheckMill.fn09} $boolType,
         ${CheckMill.bf10} $boolType,
         ${CheckMill.fn10} $boolType,
         ${CheckMill.ng01} $boolType,
         ${CheckMill.ng02} $boolType,
         ${CheckMill.ng03} $boolType,
         ${CheckMill.ng04} $boolType,
         ${CheckMill.wf01} $boolType,
         ${CheckMill.wf02} $boolType,
         ${CheckMill.wf03} $boolType,
         ${CheckMill.wf04} $boolType,
         ${CheckMill.bc01} $boolType,
         ${CheckMill.bc02} $boolType,
         ${CheckMill.bf02} $boolType,
         ${CheckMill.fn02} $boolType,
         ${CheckMill.bf03} $boolType,
         ${CheckMill.fn03} $boolType,
         ${CheckMill.bf04} $boolType,
         ${CheckMill.fn04} $boolType,
         ${CheckMill.bf05} $boolType,
         ${CheckMill.fn05} $boolType,
         ${CheckMill.bf06} $boolType,
         ${CheckMill.fn06} $boolType,
         ${CheckMill.sc01} $boolType,
         ${CheckMill.sc02} $boolType,
         ${CheckMill.sc03} $boolType,
         ${CheckMill.be01} $boolType,
         ${CheckMill.bm01} $boolType,
         ${CheckMill.lq01} $boolType,
         ${CheckMill.lq02} $boolType,
         ${CheckMill.sr01} $boolType,
         ${CheckMill.bf01} $boolType,
         ${CheckMill.fn01} $boolType,
         ${CheckMill.rf01} $boolType)
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
      columns: CheckMill.values,
      where: '${CheckMill.id} = ?',
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

    final orderBy = '${CheckMill.id}';

    final result = await db.query(tableCheck, orderBy: orderBy);

    return result.map((json) => Check.fromJson(json)).toList();
  }
}
