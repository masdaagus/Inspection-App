// import 'package:Inspection/model_database/check_model.dart';
import 'package:Inspection/model_database/mill_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:Inspection/model_database/check_model.dart';

class DatabaseMill {
  static final DatabaseMill instance = DatabaseMill.init();
  static final _databaseV1 = 1;
  DatabaseMill.init();
  static Database _database;

  static final String columnId = '_id';
  static final String username = 'username';
  static final String password = 'password';

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

    await db.execute(''' 
        create table $tableUser(
          $columnId $idType,
          $username $textType,
          $password $textType) 
    ''');

    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("Masda agus", "08126074")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("M TAUFIK INDRA", "03301768")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("ALFIAN SYAHPUTRA", "03301786")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("FRENGKI HASIOLAN SIBARA", "03301787")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("FIKRIYANTO", "03302081")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("AJI SYAHPUTRA", "03302089")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("ADE MULYADI", "03302304")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("PUJA MULIYA", "03302305")');
    await db.rawInsert(
        'INSERT INTO $tableUser ($username, $password) VALUES ("TYO CRYSTIAN", "03302486")');

    db.execute('''
      create table $tableMill(
       ${MillFields.id} $idType,
       ${MillFields.userName} $textType,
       ${MillFields.idUser} $textType,
       ${MillFields.shift} $textType,
       ${MillFields.time} $textType,

         ${MillFields.bf07l1} $boolType,
         ${MillFields.fn07l1} $boolType,
         ${MillFields.bf08l1} $boolType,
         ${MillFields.fn08l1} $boolType,
         ${MillFields.bf09l1} $boolType,
         ${MillFields.fn09l1} $boolType,
         ${MillFields.bf10l1} $boolType,
         ${MillFields.fn10l1} $boolType,
         ${MillFields.ng01l1} $boolType,
         ${MillFields.ng02l1} $boolType,
         ${MillFields.ng03l1} $boolType,
         ${MillFields.ng04l1} $boolType,
         ${MillFields.wf01l1} $boolType,
         ${MillFields.wf02l1} $boolType,
         ${MillFields.wf03l1} $boolType,
         ${MillFields.wf04l1} $boolType,
         ${MillFields.bc01l1} $boolType,
         ${MillFields.bc02l1} $boolType,
         ${MillFields.bf02l1} $boolType,
         ${MillFields.fn02l1} $boolType,
         ${MillFields.bf03l1} $boolType,
         ${MillFields.fn03l1} $boolType,
         ${MillFields.bf04l1} $boolType,
         ${MillFields.fn04l1} $boolType,
         ${MillFields.bf05l1} $boolType,
         ${MillFields.fn05l1} $boolType,
         ${MillFields.bf06l1} $boolType,
         ${MillFields.fn06l1} $boolType,
         ${MillFields.sc01l1} $boolType,
         ${MillFields.sc02l1} $boolType,
         ${MillFields.sc03l1} $boolType,
         ${MillFields.be01l1} $boolType,
         ${MillFields.bm01l1} $boolType,
         ${MillFields.lq01l1} $boolType,
         ${MillFields.lq02l1} $boolType,
         ${MillFields.sr01l1} $boolType,
         ${MillFields.bf01l1} $boolType,
         ${MillFields.fn01l1} $boolType,
         ${MillFields.rf01l1} $boolType,

          ${MillFields.bf07l2} $boolType,
          ${MillFields.fn07l2} $boolType,
          ${MillFields.bf08l2} $boolType,
          ${MillFields.fn08l2} $boolType,
          ${MillFields.bf09l2} $boolType,
          ${MillFields.fn09l2} $boolType,
          ${MillFields.bf10l2} $boolType,
          ${MillFields.fn10l2} $boolType,
          ${MillFields.ng01l2} $boolType,
          ${MillFields.ng02l2} $boolType,
          ${MillFields.ng03l2} $boolType,
          ${MillFields.ng04l2} $boolType,
          ${MillFields.wf01l2} $boolType,
          ${MillFields.wf02l2} $boolType,
          ${MillFields.wf03l2} $boolType,
          ${MillFields.wf04l2} $boolType,
          ${MillFields.bc01l2} $boolType,
          ${MillFields.bc02l2} $boolType,
          ${MillFields.bf02l2} $boolType,
          ${MillFields.fn02l2} $boolType,
          ${MillFields.bf03l2} $boolType,
          ${MillFields.fn03l2} $boolType,
          ${MillFields.bf04l2} $boolType,
          ${MillFields.fn04l2} $boolType,
          ${MillFields.bf05l2} $boolType,
          ${MillFields.fn05l2} $boolType,
          ${MillFields.bf06l2} $boolType,
          ${MillFields.fn06l2} $boolType,
          ${MillFields.sc01l2} $boolType,
          ${MillFields.sc02l2} $boolType,
          ${MillFields.sc03l2} $boolType,
          ${MillFields.be01l2} $boolType,
          ${MillFields.bm01l2} $boolType,
          ${MillFields.lq01l2} $boolType,
          ${MillFields.lq02l2} $boolType,
          ${MillFields.sr01l2} $boolType,
          ${MillFields.bf01l2} $boolType,
          ${MillFields.fn01l2} $boolType,
          ${MillFields.rf01l2} $boolType,

           ${MillFields.desbf07l1} $textType,
           ${MillFields.desfn07l1} $textType,
           ${MillFields.desbf08l1} $textType,
           ${MillFields.desfn08l1} $textType,
           ${MillFields.desbf09l1} $textType,
           ${MillFields.desfn09l1} $textType,
           ${MillFields.desbf10l1} $textType,
           ${MillFields.desfn10l1} $textType,
           ${MillFields.desng01l1} $textType,
           ${MillFields.desng02l1} $textType,
           ${MillFields.desng03l1} $textType,
           ${MillFields.desng04l1} $textType,
           ${MillFields.deswf01l1} $textType,
           ${MillFields.deswf02l1} $textType,
           ${MillFields.deswf03l1} $textType,
           ${MillFields.deswf04l1} $textType,
           ${MillFields.desbc01l1} $textType,
           ${MillFields.desbc02l1} $textType,
           ${MillFields.desbf02l1} $textType,
           ${MillFields.desfn02l1} $textType,
           ${MillFields.desbf03l1} $textType,
           ${MillFields.desfn03l1} $textType,
           ${MillFields.desbf04l1} $textType,
           ${MillFields.desfn04l1} $textType,
           ${MillFields.desbf05l1} $textType,
           ${MillFields.desfn05l1} $textType,
           ${MillFields.desbf06l1} $textType,
           ${MillFields.desfn06l1} $textType,
           ${MillFields.dessc01l1} $textType,
           ${MillFields.dessc02l1} $textType,
           ${MillFields.dessc03l1} $textType,
           ${MillFields.desbe01l1} $textType,
           ${MillFields.desbm01l1} $textType,
           ${MillFields.deslq01l1} $textType,
           ${MillFields.deslq02l1} $textType,
           ${MillFields.dessr01l1} $textType,
           ${MillFields.desbf01l1} $textType,
           ${MillFields.desfn01l1} $textType,
           ${MillFields.desrf01l1} $textType,

            ${MillFields.desbf07l2} $textType,
            ${MillFields.desfn07l2} $textType,
            ${MillFields.desbf08l2} $textType,
            ${MillFields.desfn08l2} $textType,
            ${MillFields.desbf09l2} $textType,
            ${MillFields.desfn09l2} $textType,
            ${MillFields.desbf10l2} $textType,
            ${MillFields.desfn10l2} $textType,
            ${MillFields.desng01l2} $textType,
            ${MillFields.desng02l2} $textType,
            ${MillFields.desng03l2} $textType,
            ${MillFields.desng04l2} $textType,
            ${MillFields.deswf01l2} $textType,
            ${MillFields.deswf02l2} $textType,
            ${MillFields.deswf03l2} $textType,
            ${MillFields.deswf04l2} $textType,
            ${MillFields.desbc01l2} $textType,
            ${MillFields.desbc02l2} $textType,
            ${MillFields.desbf02l2} $textType,
            ${MillFields.desfn02l2} $textType,
            ${MillFields.desbf03l2} $textType,
            ${MillFields.desfn03l2} $textType,
            ${MillFields.desbf04l2} $textType,
            ${MillFields.desfn04l2} $textType,
            ${MillFields.desbf05l2} $textType,
            ${MillFields.desfn05l2} $textType,
            ${MillFields.desbf06l2} $textType,
            ${MillFields.desfn06l2} $textType,
            ${MillFields.dessc01l2} $textType,
            ${MillFields.dessc02l2} $textType,
            ${MillFields.dessc03l2} $textType,
            ${MillFields.desbe01l2} $textType,
            ${MillFields.desbm01l2} $textType,
            ${MillFields.deslq01l2} $textType,
            ${MillFields.deslq02l2} $textType,
            ${MillFields.dessr01l2} $textType,
            ${MillFields.desbf01l2} $textType,
            ${MillFields.desfn01l2} $textType,
            ${MillFields.desrf01l2} $textType)
    ''');
  }

  Future<void> create({String table, Map<String, Object> mill}) async {
    final db = await instance.database;

    db.insert(table, mill);
  }

  Future readMill(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableMill,
      columns: MillFields.values,
      where: '${MillFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Mill.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${MillFields.time} ASC';

    final result = await db.query(tableMill, orderBy: orderBy);

    return result.map((json) => Mill.fromJson(json)).toList();
  }
}
