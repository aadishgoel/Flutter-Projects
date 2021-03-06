import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyHomePage() ));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child: new ClipPath(
            child: new Image.network('https://www.sciencedaily.com/images/2011/09/110908145053_1_540x360.jpg'),
            clipper: MyClipper(),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
    Path getClip(Size size) {
      var path = new Path();
      path.lineTo(0.0, size.height-20);
      path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height-40);
      path.quadraticBezierTo(size.width/1.34, size.height-70, size.width, size.height-40);
      path.lineTo(size.width, 0.0);
      path.close();
      return path;
    }

  @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}