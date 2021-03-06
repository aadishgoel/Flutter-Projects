import 'dart:async';
import './pages/landing_page.dart';
import './pages/app_drawer.dart';
import './pages/app_bar.dart';
import './pages/create_quote.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';

List<CameraDescription> cameras;

Future<Null> main() async{
  var cameras = await availableCameras();
  runApp(new MaterialApp(
    home: new LandingPage(),
    routes: <String, WidgetBuilder>{
      Home.routeName: (context) => new Home(),
    },
    theme: new ThemeData(
      primarySwatch: Colors.amber,
    ),
  ));
}

Future<bool> savedUserPrefrence(Map details) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', details['name']);
  prefs.setString('email', details['email']);
  prefs.setString('picture', details['picture']);
  return prefs.commit();
}

Future<Map> getUserPrefrence() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString('name');
  String email = prefs.getString('email');
  String picture = prefs.getString('picture');
  Map details = {'name':name, 'email':email, 'picture':picture};
  return details;
}


class Home extends StatefulWidget{
  static String routeName = '/home';
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

 PageController _pageController;
 int _page=0;
 String userName='Tourist';
 String userEmail='tourist@quotes';
 String userPicture='';

  void navigationTapped(int page){
    _pageController.animateToPage(
      page,
      duration: new Duration(milliseconds: 300),
      curve: Curves.ease
    );
  }

   void onPageChanged(int page){
     setState((){
       this._page = page;
     });
   } 

  @override
  void initState(){
    super.initState();
    getUserPrefrence().then((details){
      setState(() {
        print('Entered');
        print(details);
        this.userName = details['name'];
        this.userEmail = details['email'];
        print(details['email']);
        print(this.userEmail);
        this.userPicture = details['picture'];
        print(details['picture']);
        print(this.userPicture);
      }); 
    });
    _pageController = new PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(),
      drawer: new AppDrawer(userName, userEmail, userPicture),
      body: new  PageView(
          children: <Widget>[
            //new Container(color: Colors.red,
            //child: 
            new QuotesList('life quotes'),
            new QuotesList('motivation quotes'),
            new QuotesList('poems'),
            //child: ListView.builder(
            //  )
            //),
            //new Container(color: Colors.blue),
            //new Container(color: Colors.green)
          ],

          controller: _pageController,
          onPageChanged: onPageChanged,
        ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {print('Floating button pressed by Aadish'); new CreateQuote();},
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(title: new Text('Life'),icon: new Icon(Icons.ac_unit)),
            new BottomNavigationBarItem(title: new Text('Motivation'),icon: new Icon(Icons.ac_unit)),
            new BottomNavigationBarItem(title: new Text('Poems'),icon: new Icon(Icons.ac_unit))
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        )

    );
  }
}



class QuotesList extends StatelessWidget {
  String  container;
  QuotesList(this.container);
  
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(this.container).snapshots,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return 
           new Card(
             child:  new Column(
               children: <Widget>[
                 new ListTile(
                  leading: new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: new Text(document['writer'][0].toUpperCase()),
                  ),    
                  title: new Text(document['writer']),
                 ),
                 new ListTile(
                  subtitle: new Text(document['quote']),
                 ),
                 new ListTile(
                   title: new Row(
                     children: <Widget>[
                       new Icon(Icons.favorite_border),
                       new Padding(padding: const EdgeInsets.only(left: 10.0)),
                       new Icon(Icons.comment)
                     ],
                   ),
                   trailing: new Icon(Icons.more_horiz),
                 ),
               ],
             )
           );
          }).toList(),
        );
      },
    );
  }
}