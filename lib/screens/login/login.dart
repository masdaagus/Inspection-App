import 'package:Inspection/config/palette.dart';

import 'package:Inspection/service/login%20service/response/login_respon.dart';

import 'package:Inspection/screens/dashbord/dashbord.dart';
import 'package:Inspection/service/models/users.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginScreenState extends State<LoginScreen> implements LoginCallBack {
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginResponse _response;

  _LoginScreenState() {
    _response = new LoginResponse(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        form.save();
        _response.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      String masda = preferences.getString("user");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
      print("Value from getPref:  $masda");
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    print("update screen");
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Palette.backgroundColor,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/login_baground.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 120, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey[800].withOpacity(.83)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Welcom to",
                                style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 1,
                                  color: Colors.yellow[700],
                                ),
                                children: [
                                  TextSpan(
                                    text: " Cemindo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 29,
                                      color: Colors.yellow[700],
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Login to Continue",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 300,
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                  letterSpacing: 2),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    onSaved: (val) => _username = val,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    onSaved: (val) =>
                                        _password = val.toString(),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35)),
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "ID",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  margin: EdgeInsets.only(top: 10),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text:
                                            "By pressing 'Submit' you agree to our ",
                                        style: TextStyle(
                                            color: Palette.textColor2,
                                            fontSize: 12),
                                        children: [
                                          TextSpan(
                                            text: "term & conditions",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 12),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 480,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _submit,
                    child: Center(
                      child: Container(
                        height: 90,
                        width: 90,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1.5,
                                blurRadius: 10,
                              )
                            ]),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff30638e).withOpacity(.2),
                                  Color(0xff003d5b).withOpacity(.2),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.3),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff30638e).withOpacity(.2),
                                      Color(0xff003d5b).withOpacity(.2),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 1))
                                ]),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;

      case LoginStatus.signIn:
        return Dashbaord();
        break;
    }
  }

  savePref(int value, String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
      // preferences.commit();
    });
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
  }

  @override
  void onLoginSuccess(User user) async {
    if (user != null) {
      savePref(1, user.name, user.password);
      print('${user.name} + ${user.password}');
      _loginStatus = LoginStatus.signIn;
    } else {
      _showSnackBar("Login Gagal, Silahkan Periksa Login Anda");
    }
  }
}
