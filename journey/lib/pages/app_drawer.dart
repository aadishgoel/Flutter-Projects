import 'package:flutter/material.dart';

class Appdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text('Aadish'),
              accountEmail: new Text('aadishgoel2013@gmail.com'),
              currentAccountPicture: 
              new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('A'),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('O'),
                ),
              ],
            ),
            new ListTile(
              title: new Text('Page One'),
              trailing: new Icon(Icons.arrow_upward),
            ),
            new ListTile(
              title: new Text('Second One'),
              trailing: new Icon(Icons.arrow_upward),
            ),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
            new Divider(),
            new ListTile(
              title: new Text('About Developer'),
              trailing: new Icon(Icons.developer_mode)
            )
        ],
      ),
    );
  }
}