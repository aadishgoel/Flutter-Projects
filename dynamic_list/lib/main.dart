import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Photo Streamer',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home:PhotoList()
    );
  }
}

class PhotoList extends StatefulWidget {
  @override
  _PhotoListState createState() => new _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  StreamController<Photo> streamController;
  List<Photo> list = [];

  @override
    void initState() {
      super.initState();
      streamController = StreamController.broadcast();
      streamController.stream.listen( (photo)=>setState(()=>list.add(photo) ) );
      load(streamController);
    }

  load(StreamController sc) async{
    String url = 'https://jsonplaceholder.typicode.com/photos';
    var client = new http.Client();
    var req = new http.Request('get', Uri.parse(url));
    var streamedRes = await client.send(req);

    streamedRes.stream
    .transform(UTF8.decoder)
    .transform(json.decoder)
    .expand((e)=>e)
    .map((map)=>Photo.fromJsonMap(map))
    .pipe(streamController);
  }

  @override
    void dispose() {
      super.dispose();
      streamController?.close();
      streamController = null;
    }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Photo Stream'),),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context,int i)=> _makeElement(i),
        ),
      ),
    );
  }
  Widget _makeElement(int index){
      if(index >= list.length) return null;
      return Container(
        padding: new EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Image.network(list[index].url),
            Text(list[index].title)
          ],
        ),
      );
    }
}

class Photo{
  final String title;
  final String url;

  Photo.fromJsonMap(Map map) : title=map['title'],url=map['url'];

}