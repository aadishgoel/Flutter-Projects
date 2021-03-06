import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;

void main(){
  runApp(new MaterialApp(
    home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget{
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Story'),
        backgroundColor: Colors.brown[800],
        bottom: new TabBar(
          controller: controller,  
          tabs: <Tab>[
           new Tab(icon: new Icon(Icons.arrow_forward),),
           new Tab(icon: new Icon(Icons.arrow_downward) ),
           new Tab(icon: new Icon(Icons.arrow_back))
         ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.brown[800],
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward),),
            new Tab(icon: new Icon(Icons.arrow_upward) ),
            new Tab(icon: new Icon(Icons.arrow_back))
          ],
        ),
      )
    );
  }   
}

