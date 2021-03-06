import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {

  final IconData icon;
  final String text;

  PauseButton({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
            splashColor: const Color(0x22000000),
            onPressed: (){},
            child: new Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(right: 7.0),
                  child: new Icon(icon, color: Colors.black),
                ),
                new Text(text, style: new TextStyle(
                  color: Colors.black, 
                  fontSize:20.0, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0
                  ))
              ],
            ),
            )
          );
  }
}