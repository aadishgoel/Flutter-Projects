import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MaterialApp(home:new RandomWords()));

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => new _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _pushSaved(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: _saved.map((pair){
                return(
                  new ListTile(
                    title: new Text(pair.asPascalCase, style: _biggerFont),
                  )
                );
              })
            ).toList()
          ),
        );
      }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );


  }

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
   );
  } 

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text( pair.asPascalCase, style: _biggerFont ),
      trailing: new Icon(
        alreadySaved? Icons.favorite: Icons.favorite_border,
        color: alreadySaved?Colors.red:null,
      ),
      onTap: (){
        setState((){
          if(alreadySaved) _saved.remove(pair);
          else _saved.add(pair);
        });
      },
    );
  }
}