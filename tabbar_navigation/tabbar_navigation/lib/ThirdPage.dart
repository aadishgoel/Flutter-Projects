import 'package:flutter/material.dart';

class Third extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:new AppBar(title: new Text('Pizza'), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Icon(Icons.local_pizza, size:150.0 ,color:Colors.teal),
        ),
      )
    );
  }
}