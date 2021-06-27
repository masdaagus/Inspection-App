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
  // static User fromJson(Map<String, Object> json) => User(
  //       id: json['_id'] as int,
  //       username: json['username'] as String,
  //       password: json['password'] as String,
  //     );
  int get id => _id;
  String get name => _user;
  String get password => _password;

  // Map<String, dynamic> toMap() {
  //   var map = Map<String, dynamic>();

  //   map['_id'] == _id;
  //   map['username'] == _user;
  //   map['password'] == _password;
  //   return map;
  // }
}
