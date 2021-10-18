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
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    blurRadius: 12,
                    offset: Offset(4, 4)),
                BoxShadow(
                  blurRadius: 12,
                  offset: Offset(-4, -4),
                  color: Colors.black.withOpacity(.10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Image(
                    color: Colors.grey[850],
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
