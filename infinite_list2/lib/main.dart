import 'package:flutter/material.dart';
import 'models.dart';
import 'dart:async';

void main() { 
  var _routes = <String, WidgetBuilder>{
    '/todos':(BuildContext context) => new TodosPage(),

  } ;  
  runApp(new MaterialApp(
  home: HomePage(),
  routes: _routes,
));
}

///  route '/'
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(title: new Text('My Home Page'),),
       body: new RaisedButton(
         child: new Text('My Todos'),
         onPressed: _onPressed,
       )
    );
  }
  
  void _onPressed(){
    Navigator.of(context).pushNamed('/todos');
  }
}

/// route '/todos'
class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => new _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('My Todos'),),
      body: new RefreshIndicator(
        child: new ListView.builder(
          itemBuilder: _itemBuilder,
        ),
        onRefresh: _onRefresh,
      ),
    );
  
    }

  Future<Null> _onRefresh(){
    Completer<Null> completer = new Completer<Null>();
    Timer timer = new Timer(new Duration(seconds: 3), (){ completer.complete(); });
    return completer.future;
  }

  Widget _itemBuilder(BuildContext context, int index){
    Todo todo = getTodo(index);
    return new TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index){
    return new Todo(false, 'Todo $index');
  }
}

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget({Key key, this.todo}): super(key: key);

  final Todo todo;

  @override
  _TodoItemWidgetState createState() => new _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(Icons.star),
      title: new Text(widget.todo.name),
      onTap: _onTap,
    );
  }

  void _onTap(){

  }
  
}