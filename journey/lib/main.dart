import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
//import 'package:camera/camera.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import './pages/app_drawer.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
//List<CameraDescription> cameras;

Future<Null> main() async{
  //var cameras = await availableCameras();
  runApp(new MaterialApp(
    home: new HomeScreen(),
    routes: <String, WidgetBuilder>{
      HomeScreen.routeName: (context)=> new HomeScreen(),
    },
    theme: new ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
  ));
}


class HomeScreen extends StatelessWidget {
  static String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return new Scaffold( 
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        elevation: 0.0,
        title: new Text("Add Picture"),
      ),
      drawer: new Appdrawer(),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded( child:Container(
            color:  Colors.deepPurple[300],
            child:new Column(
              
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.linked_camera, size: 100.0,color: Colors.white),
                  onPressed: (){},
                ),
               
                
              ],
            ),
          )),
          
          Expanded( child:Container(
            color:  Colors.blueGrey[800],
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:new AnimatedCircularChart(
                  key: _chartKey,
                  size: new Size(50.0, 50.0),
                  initialChartData: <CircularStackEntry>[
                    new CircularStackEntry(
                      <CircularSegmentEntry>[
                        new CircularSegmentEntry(
                          33.33,
                          Colors.blue[400],
                          rankKey: 'completed',
                        ),
                        new CircularSegmentEntry(
                          66.67,
                          Colors.blueGrey[600],
                          rankKey: 'remaining',
                        ),
                      ],
                      rankKey: 'progress',
                    ),
                  ],
                  chartType: CircularChartType.Radial,
                  percentageValues: true,
                  holeLabel: '1/3',
                  labelStyle: new TextStyle(
                    color: Colors.blueGrey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ) 
                ),
              ],
            ),

          )),
        ],
      ),
    );
  }
}

