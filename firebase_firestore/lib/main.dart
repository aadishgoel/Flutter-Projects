import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() => runApp(new MaterialApp(
  home: new Home(),
));


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  String myText;
  StreamSubscription<DocumentSnapshot> subscription;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final DocumentReference documentReference = Firestore.instance.document('testData/dummy');

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    print("User Email : ${user.email}");

    return user;
  }

  void _signOut() {
    _googleSignIn.signOut();
    print("User Signed out");
  } 

  void _add(){
    Map<String, String> data = <String, String>{
      'name':'Aadish1',
      'Desc':'Dummy Data Added',
      'hi':'hello'
    }; 
    documentReference.setData(data).whenComplete((){ print('Document Added'); }). catchError((e){ print(e); });
  }

  void _delete(){
    documentReference.delete().whenComplete((){ print('Deleted'); setState((){}); }).catchError((e)=>print(e));
  }

  void _update(){
    Map<String, String> data = <String, String>{
      'name':'Aadish Goel',
      'Desc':'Dummy Data Updated',
    };
    documentReference.updateData(data).whenComplete(() { print('Document Updated');}).catchError((e){print(e);}) ;
  }

  void _fetch(){
    documentReference.get().then((dataSnapshot){ 
      print('fetch started');
      if(dataSnapshot.exists){
        setState(() {
          myText = dataSnapshot.data['Desc'];
        });
        
      } 
    });
  }

  @override
    void initState() {
      super.initState();
      subscription = documentReference.snapshots.listen((dataSnapshot){ 
      print('fetch started');
      if(dataSnapshot.exists){
        setState(() {
          myText = dataSnapshot.data['Desc'];
        }); 
      } 
    });
    }

  @override
    void dispose() {
      subscription?.cancel();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Firebase Demo"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new RaisedButton(
              onPressed: () => _signIn()
                  .then((FirebaseUser user) => print(user))
                  .catchError((e) => print(e)),
              child: new Text("Sign In"),
              color: Colors.green,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: _signOut,
              child: new Text("Sign out"),
              color: Colors.red,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: _add,
              child: new Text("Add"),
              color: Colors.cyan,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: _update,
              child: new Text("Update"),
              color: Colors.blue,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: _delete,
              child: new Text("Delete"),
              color: Colors.red,
            ),new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: _fetch,
              child: new Text("Fetch"),
              color: Colors.orange,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            
            myText == null
            ? new Container()
            : new Text( myText,
              style: new TextStyle(fontSize: 20.0 ),
            )

            
            
          ],
        ),
      ),
    );
  }
}
