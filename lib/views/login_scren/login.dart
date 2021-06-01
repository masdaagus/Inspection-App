import 'package:flutter/material.dart';
import 'components/button.dart';
import 'components/image&text.dart';
import 'components/text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //       Color(0xff2b2d42).withOpacity(.55),
          //       Color(0xff183C4A).withOpacity(.65)
          //     ])),
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 12),
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
