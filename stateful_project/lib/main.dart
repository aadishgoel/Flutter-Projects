import 'package:flutter/material.dart';

void main() =>  runApp(new MaterialApp( home: new AwesomeButton() ));


class AwesomeButton extends StatefulWidget{
  @override
  AwesomeButtonState createState() => new AwesomeButtonState(); 

}

class AwesomeButtonState extends State<AwesomeButton>{

  int counter=0;
  List<String> strings = ['Flutter', 'is', 'Awesome', 'and', 'Aadish', 'loves', 'it.'];
  String displayedString = ""; 

  void onPressed(){
    setState( (){
      displayedString = strings[counter];
      counter = (counter+1)%strings.length;
    });
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar( title: new Text('Hello Aadish'), backgroundColor: Colors.deepOrange ,),
      body: new Container(
        child:new Center(
          child:new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(displayedString, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold )),
              new Padding(padding: new EdgeInsets.all(15.0),),
              new RaisedButton(
                child: new Text('Press Me!', style: new TextStyle(color: Colors.white, fontSize:20.0, fontStyle: FontStyle.italic),),
                color: Colors.red,
                onPressed: onPressed,
              )
            ],
          
          )  
        )
      ),
    );
  }
}



