import 'package:flutter/material.dart';
import 'package:fluttery/framing.dart';

import './pages/time_display.dart';
import './pages/pause_button.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
    title: 'Egg Timer',
    theme: new ThemeData(
      fontFamily: 'BebasNeue',
    ),

));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new TimeDisplay(),
          new RandomColorBlock(
            width: double.INFINITY,
            child: new Padding(
              padding:  const EdgeInsets.all(30.0),
              child: new AspectRatio(
                aspectRatio: 1.0,
                child: new RandomColorBlock(
                  width: double.INFINITY,
                ),
              )
            ),
          ),
          new Expanded(child: new Container()),
          new Row(
            children: <Widget>[
               new PauseButton(
                icon: Icons.pause,
                text: 'Pause',
              ),
              new Expanded(child: new Container()),
               new PauseButton(
                icon: Icons.pause,
                text: 'Pause',
              ),
            ],
          ),
          new PauseButton(
            icon: Icons.pause,
            text: 'Pause',
          ),
        ],
      )
    );
  }
}