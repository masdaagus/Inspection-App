import 'package:Inspection/views/list_screen/home.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeListScreen()),
        );
      },
      child: Container(
        height: 45,
        width: 220,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff1d3557).withOpacity(0.4),
              Color(0xff264653).withOpacity(.7)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: EdgeInsets.all(13),
          child: Center(
            child: Text(
              "LOGIN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Londrina',
                  letterSpacing: 4),
            ),
          ),
        ),
      ),
    );
  }
}
