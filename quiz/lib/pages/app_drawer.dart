import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  String userName, userEmail, userPicture;
  AppDrawer(this.userName, this.userEmail, this.userPicture);
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(userName),
              accountEmail: new Text(userEmail),
              currentAccountPicture: 
              (userPicture=='' || userPicture==null)?
              new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text(userName[0].toUpperCase()),
              ):
              new CircleAvatar(
                backgroundImage:new NetworkImage(userPicture),
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