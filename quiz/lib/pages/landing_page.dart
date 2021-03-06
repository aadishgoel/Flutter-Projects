import 'dart:async';
import '../main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth  _auth =  FirebaseAuth.instance ;  
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class LandingPage extends StatefulWidget {
  @override 
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onLongPress: () => Navigator.of(context).pushNamed(Home.routeName),
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('Quotes', style: new TextStyle(color: Colors.white, fontSize:50.0, fontWeight: FontWeight.bold)),
            new Text('The Art of Living!', style: new TextStyle(color: Colors.white, fontSize: 25.0 )),    
            new RaisedButton(
              color: Colors.amber,
              child: new Text('Sign In'),
              onPressed: () {testSignInWithGoogle();},
            )
          ],
        )
      )  
    );
  }

  Future<String> testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    Map details={'name':user.displayName, 'email': user.email, 'picture':user.photoUrl};
    print(details);
    savedUserPrefrence(details).then((bool commited){
      Navigator.of(context).pushNamed(Home.routeName);
    });
    return 'signInWithGoogle succeeded: ${user.displayName}';
  }
}


