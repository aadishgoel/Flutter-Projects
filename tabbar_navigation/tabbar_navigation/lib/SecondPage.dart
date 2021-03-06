import 'package:flutter/material.dart';

class Second extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:new AppBar(title: new Text('Love'), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Icon(Icons.favorite, size:150.0 ,color:Colors.redAccent),
        ),
      )
    );
  }
}