import 'package:flutter/material.dart';




class CreateQuote extends StatefulWidget {
  
  @override
  _CreateQuoteState createState() => new _CreateQuoteState();
}

class _CreateQuoteState extends State<CreateQuote> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lime,
      body:new Center(
        child:new Text('Your Quote Here'),
      )
    );
  }
}