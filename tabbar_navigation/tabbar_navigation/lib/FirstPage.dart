import 'package:flutter/material.dart';

class First extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:new AppBar(title: new Text('Aadish'), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Icon(Icons.accessibility, size:150.0 ,color:Colors.brown),
        ),
      )
    );
  }
}