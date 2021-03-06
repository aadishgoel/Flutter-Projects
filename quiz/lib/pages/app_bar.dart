import 'package:flutter/material.dart';

enum Choice { latest, trending, relevant }

class MyAppBar extends AppBar{
  MyAppBar({Key key, Widget title}): super(key: key,
   title: new Text('Quotes', style: new TextStyle(fontSize: 20.0, color:  Colors.white),), 
    actions: <Widget>[
      new IconButton(
        icon: new Icon(Icons.search),
        onPressed: (){},
        ),
      new IconButton(
        icon: new Icon(Icons.notifications_none),
        onPressed: (){},
        ),
        
      new PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
          new PopupMenuItem(child: new FlatButton( child: new Text('Latest'), onPressed: (){},)),
          new PopupMenuItem(child: new FlatButton( child: new Text('Trending'), onPressed: (){},)),
          new PopupMenuItem(child: new FlatButton( child: new Text('Relevant'), onPressed: (){},)),
        ],
      ),
    ],
  );   
}