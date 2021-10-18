import 'package:sqflite/sqflite.dart';

final String tableUser = 'TableUser';

Future userTable(Database db) async {
  final String columnId = '_id';
  final String username = 'username';
  final String password = 'password';

  final idType = 'integer primary key autoincrement';
  final textType = 'text not null';

  db.execute(''' 
        create table $tableUser(
          $columnId $idType,
          $username $textType,
          $password $textType) 
    ''');

  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("MASDA AGUS", "00000000")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("M TAUFIK INDRA", "03301768")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("WILIAM IRIANSYAH", "03301786")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("FRENGKI HASIHOLAN SIBARANI", "03301787")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("FIKRIYANTO", "03302081")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("AJI SYAHPUTRA", "03302089")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("ADE MULYADI", "03302304")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("PUJA MULIYA", "03302305")');
  db.rawInsert(
      'INSERT INTO $tableUser ($username, $password) VALUES ("TYO CRYSTIAN", "03302486")');
}
