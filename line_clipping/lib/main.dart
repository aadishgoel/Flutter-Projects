import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyHomePage() ) );

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ 
          new ClipPath(
            child:new Image.network('https://www.sciencedaily.com/images/2011/09/110908145053_1_540x360.jpg'),
            clipper: new MyClipper1(),
          ),
          new ClipPath(
            child:new Image.network('https://www.sciencedaily.com/images/2011/09/110908145053_1_540x360.jpg'),
            clipper: new MyClipper2(),
          ),
        ]
      )
    );     
  }
}

class MyClipper1 extends CustomClipper<Path>{

 @override
   Path getClip(Size size) {
     var path = new Path();
     path.lineTo(size.width, 0.0);
     path.lineTo(0.0, size.height);
     path.close();
     return path;
   } 

   @override
     bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

class MyClipper2 extends CustomClipper<Path>{

 @override
   Path getClip(Size size) {
     var path = new Path();
     path.moveTo(size.width, 0.0);
     path.lineTo(size.width, size.height);
     path.lineTo(0.0, size.height);
     path.close();
     return path;
   } 

   @override
     bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}