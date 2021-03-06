import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp( home:new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var input='Input',output='Output';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Text(input, style: new TextStyle(fontSize: 40.0),),
          new Text(output, style: new TextStyle(fontSize: 40.0),),
          new Container(
            height: 400.0,
            alignment: new Alignment(100.0, 200.0),
            child: Row(
            
              children: <Widget>[
                new Container(
                  color: Colors.grey[900],
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new FlatButton(child: new Text('7',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('8',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('9',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                        ],
                      ),
                    new Row(
                        children: <Widget>[
                          new FlatButton(child: new Text('4',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('5',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('6',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new FlatButton(child: new Text('1',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('2',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('3',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new FlatButton(child: new Text('.',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('0',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                          new FlatButton(child: new Text('=',style: new TextStyle(color: Colors.white, fontSize: 30.0)), onPressed: (){},),
                        ],
                      ),  
                    ],
                  ),
                ),
                new Container(
                  color: Colors.grey[850],
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    new FlatButton(child: new Text('DEL',style: new TextStyle(color: Colors.white)), onPressed: (){},),
                    new FlatButton(child: new Text('/',style: new TextStyle(color: Colors.white)), onPressed: (){},),
                    new FlatButton(child: new Text('x',style: new TextStyle(color: Colors.white)), onPressed: (){},),
                    new FlatButton(child: new Text('-',style: new TextStyle(color: Colors.white)), onPressed: (){},),
                    new FlatButton(child: new Text('+',style: new TextStyle(color: Colors.white)), onPressed: (){},)
                    ],
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}