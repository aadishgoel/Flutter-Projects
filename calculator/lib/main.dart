import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.red
  ),
  home: new Calculator(),
) );

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var num1=0,num2=0,sum=0;

  final TextEditingController t1 = new TextEditingController(text: '0');
  final TextEditingController t2 = new TextEditingController(text: '0');

  void doAddition(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });

  } void doSubtraction(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }
  void doMultiplication(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDivision(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Calculator'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Output: $sum',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.purple
            ),
            ),
            new TextField(
               keyboardType: TextInputType.number,
               decoration: new InputDecoration(
                hintText: 'Enter Here!'
               ),
               controller: t1,
            ),
            new TextField(
               keyboardType: TextInputType.number,
               decoration: new InputDecoration(
                 hintText: 'Enter Here!'
               ),
               controller: t2,
            ),
            new Padding(padding: new EdgeInsets.only(top:20.0 ) ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text('+'),
                  onPressed: doAddition 
                ),
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text('-'),
                  onPressed: doSubtraction
                ),
                
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top:20.0 ) ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text('*'),
                  onPressed: doMultiplication
                ),
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text('/'),
                  onPressed: doDivision
                ),
                
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top:20.0 ) ),
            new Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text('Clear'),
                  onPressed: () => setState(() { t1.text='0'; t2.text='0';  } )
                ),
              ]
            )

          
          
          
          
          ],
        )
      ),
    );  
  }
}