import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                counterText: '',
                prefixText: 'ID - ',
                prefixIcon: Icon(Icons.quick_contacts_mail_rounded),
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                labelText: 'NPM',
                contentPadding: EdgeInsets.all(8),
              ),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                prefixIcon: Icon(Icons.perm_identity),
                focusColor: Colors.red,
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                hintText: 'Name',
                labelText: 'Name',
                contentPadding: EdgeInsets.all(8),
              ),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
