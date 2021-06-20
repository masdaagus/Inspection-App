import 'package:flutter/material.dart';

class TextDanGambar extends StatelessWidget {
  const TextDanGambar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Text(
              "INSPECTION FIELD",
              style: TextStyle(
                  color: Colors.black, fontSize: 28, fontFamily: 'Londrina'),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(32),
          child: Image(
            height: MediaQuery.of(context).size.height * 0.27,
            image: AssetImage("assets/images/Badakk.jpg"),
          ),
        )
      ],
    );
  }
}
