import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main(){ //runApp(new MyApp());
  Storage storage;
  storage.writeData('Hello, World');
  storage.readData().then((value){print(value);});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Reading Writing',
      home: Home(storage: Storage()),
    );
  }
}

class Home extends StatefulWidget {
  final Storage storage;
  Home({Key key, @required this.storage}): super(key:key);
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold();
  }
}

class Storage{
  Future<String> get localPath async{
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async{
    final path = await localPath;
    return File('$path/data.txt');
  }

  Future<String> readData() async{
     try{
      final file=await localFile;
      String body=await file.readAsString();
      return body;
    }catch(e){ return(e.toString()); }
  }

  Future<File> writeData(String data) async{
    final file = await localFile;
    return file.writeAsString('$data');
  } 
}