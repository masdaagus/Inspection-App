import 'package:Inspection/views/const/const.dart';
import 'package:flutter/material.dart';
import 'components/button.dart';
import 'components/image&text.dart';
import 'components/text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextDanGambar(),
                  TextFieldLogin(),
                  LoginButton(),
                  SizedBox(height: 30)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
