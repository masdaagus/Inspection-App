import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String tittle;
  final String image;
  final Function press;

  const BuildCard({
    Key key,
    this.tittle,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(colors: [
              //   Color(0xff30638e).withOpacity(.15),
              //   Color(0xff003d5b).withOpacity(.15),
              // ], begin: Alignment.topRight, end: Alignment.bottomRight),
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 8,
                    spreadRadius: 3),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
                Text(
                  tittle,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
