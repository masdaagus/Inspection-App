import 'dart:async';

import 'package:Inspection/Database/database_mill.dart';
import 'package:Inspection/models/mill_model.dart';
import 'package:Inspection/models/users.dart';

class LoginRequest {
  DatabaseMill db = new DatabaseMill.init();

  Future<User> getLogin(String _name, String _password) async {
    var dbClient = await db.database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM $tableUser WHERE username = '$_name' and password = '$_password'");

    if (res.length > 0) {
      print(res);
      return new User.fromMap(res.first);
    }

    return null;
  }
}
