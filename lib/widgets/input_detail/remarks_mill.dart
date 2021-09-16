import 'package:flutter/material.dart';

class RemarksMill extends StatefulWidget {
  RemarksMill({Key key, @required this.data}) : super(key: key);
  final data;

  @override
  _RemarksMillState createState() => _RemarksMillState();
}

class _RemarksMillState extends State<RemarksMill> {
  TextEditingController _controller1;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.data.description_1);
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
                  SizedBox(height: 28),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
