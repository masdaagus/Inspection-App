class User {
  int _id;
  String _user;
  String _password;

  User(
    this._id,
    this._user,
    this._password,
  );

  User.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._user = obj['username'];
    this._password = obj['password'];
  }
  int get id => _id;
  String get name => _user;
  String get password => _password;
}
