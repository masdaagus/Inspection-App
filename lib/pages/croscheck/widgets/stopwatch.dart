import 'dart:async';

import 'package:flutter/material.dart';

import 'button-stopwatch.dart';

class StopwatchWidget extends StatefulWidget {
  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  bool _start = true;
  bool _stop = true;
  bool _reset = true;

  String stopdisplay = '00:00:00';
  Stopwatch swatch = Stopwatch();
  final dur = const Duration(milliseconds: 1);

  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (swatch.isRunning) {
      starttimer();
    }
    setState(() {
      stopdisplay = swatch.elapsed.inMinutes.toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inMilliseconds % 60).toString().padLeft(2, "0");
    });
    _reset = false;
  }

  void startstopwatch() {
    setState(() {
      _stop = false;
      _start = false;
      _reset = false;
    });
    swatch.start();
    starttimer();
  }

  void stopstopwatch() {
    setState(() {
      _stop = true;
      _reset = false;
      _start = true;
    });
    swatch.stop();
  }

  void resetstopwatch() {
    setState(() {
      _start = true;
      stopdisplay = "00:00:00";
    });
    swatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    print("state");
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(stopdisplay,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonStopwatch(
                  icon: Icons.restart_alt_sharp,
                  onTap: () {
                    // ignore: unnecessary_statements
                    _reset ? null : resetstopwatch();
                  }),
              ButtonStopwatch(
                  icon: Icons.pause_circle_sharp,
                  onTap: () {
                    // ignore: unnecessary_statements
                    _stop ? null : stopstopwatch();
                  }),
              ButtonStopwatch(
                  icon: Icons.play_circle_sharp,
                  onTap: () {
                    // ignore: unnecessary_statements
                    _start ? startstopwatch() : null;
                  }),
            ],
          ),
        ],
      ),
    );
  }
}


// 0xfffff4f1