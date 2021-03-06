import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SQFLite App',
      theme: new ThemeData(primarySwatch: Colors.teal)
    );
  }
}