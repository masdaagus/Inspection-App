import 'package:flutter/material.dart';

class RemarksPacker extends StatefulWidget {
  const RemarksPacker({Key key, @required this.data}) : super(key: key);
  final data;

  @override
  _RemarksPackerState createState() => _RemarksPackerState();
}

class _RemarksPackerState extends State<RemarksPacker> {
  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.data.description_1);
    _controller2 = TextEditingController(text: widget.data.description_2);
    _controller3 = TextEditingController(text: widget.data.description_3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          widget.data.equipments,
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
                widget.data.code,
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
                      widget.data.description_1 = value;
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
                      widget.data.description_2 = value;
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
                      "Line #3",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                    controller: _controller3,
                    onChanged: (value) {
                      widget.data.description_3 = value;
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
        ),
      ),
    );
  }
}
