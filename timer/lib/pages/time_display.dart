import 'package:flutter/material.dart';

class TimeDisplay extends StatefulWidget {
  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child : new Text(
      '15:23',
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'BebasNeue',
        fontSize: 120.0,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.0
      ),
    ));
  }
}