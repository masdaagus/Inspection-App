import 'package:Inspection/Packer/models/data_packer.dart';
import 'package:flutter/material.dart';

class Remarks extends StatelessWidget {
  Remarks({Key key, @required this.data}) : super(key: key);
  final DataPacker data;

  TextEditingController _controller1;
  TextEditingController _controller2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          data.equipments,
          style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                  child: Text(
                data.code,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              )))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        // elevation: 0,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                          "Remarks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Line #1",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextField(
                      controller: _controller1,
                      onChanged: (value) {
                        data.description1 = value;
                      },
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Line #2",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextField(
                      controller: _controller2,
                      onChanged: (value) {
                        data.description2 = value;
                      },
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
