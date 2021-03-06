import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'package:path/path.dart';
//import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:audio_recorder/audio_recorder.dart'; 
//import 'package:path_provider/path_provider.dart'; 
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp( new MaterialApp(
    home: new MyApp(
    ),
    theme: new ThemeData(
      primaryColor: Colors.teal[900],
      accentColor: Colors.tealAccent,
          
    )
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File sampleImage;
  List data;
  String ip="192.168.69.47:5000"; 
  List<String> _options;  
  var _option;

  final TextEditingController controller = new TextEditingController();

    @override
    void initState() {  
      super.initState();
      _options=['Object Detection','Text Summarization'];
      _option = _options.elementAt(0);
    }

    void _onChanged(String value){
    setState(() {
      _option=value;
    });
    print(_option);
    }

  Future<String> getData() async{
    /*var response = await http.get(
      Uri.encodeFull('http://192.168.69.47:5000/try/aadish'),
      headers: {
        "Accept":"application/json"
      }
      );*/
      var response = http.post( Uri.encodeFull('http://192.168.69.47:5000/'), body: {"name": "doodle", "color": "blue"});
      print(response);
      //var response = await http.post('http://192.168.69.47:5000/',body: {"name": "doodle", "color": "blue"});
    /*
    Dio dio = new Dio();
    Response<String> response=await dio.get( new Uri.http("http://192.168.69.47:5000/", ""));
      
      print('##');
    */  
  }

  Future getGalleryImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
          sampleImage = tempImage;
        });

  } 

  Future getCameraImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
          sampleImage = tempImage;
        });

  }

  

  /*
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

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

  */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Mozek.AI'),
        actions: <Widget>[
          new DropdownButton(
            value: _option,
            items: _options.map((String value){
              return new DropdownMenuItem(
                value: value,
                child: new Text(value, style: new TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold)),
              );
            }).toList(),
            onChanged: (value)=>_onChanged(value),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: new Column(
        children: <Widget>[
        new Container(
          height: 10.0,
        ),  
        
        new Text("Server at "+ip),
        Container(
          padding: EdgeInsets.all(5.0),
          child: new TextField(
          decoration: InputDecoration(
              filled: true,
                border: OutlineInputBorder(),
                labelText: "Enter Server IP"),
          onSubmitted: (String str){
            setState(() {
              ip= str;
            });
            controller.text = "";
          },
          controller: controller,
        )),
        
        new Container(
          height: 10.0,
        ),
        new Expanded(
          child: new Center(
        child: sampleImage == null? Text(
          'Select an image',
          style: new TextStyle(color:Colors.teal[900], fontWeight: FontWeight.bold, fontSize: 30.0),
        ): enableUpload(),
      
      ))
         
        
        ],
      ),

      floatingActionButton: 
      new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          
          new FloatingActionButton(
            onPressed: getGalleryImage,
            tooltip: 'Add Image',
            child: new Icon(Icons.book)),
          new Container(
            //color: Colors.green,
            width: 8.0,
            height: 8.0,
          ),
          new FloatingActionButton(
            onPressed: getCameraImage,
            tooltip: 'Add Image',
            child: new Icon(Icons.camera)),
          new Container(
            //color: Colors.green,
            width: 8.0,
            height: 8.0,
          ),
         /* new FloatingActionButton(
            onPressed: getData,
            tooltip: 'Add Image',
            child: new Icon(Icons.book)), */
      ])
    );
  }

  Widget enableUpload(){
  return Container(
    child: Column(
      children: <Widget>[
        Image.file(sampleImage, height: 300.0, width: 300.0),
        RaisedButton(
          elevation: 7.0,
          child: Text('Upload'),
          textColor: Colors.white,
          color: Colors.teal[900],
            onPressed: () async {
            /*
            var postUri = Uri.parse('http://192.168.69.47:5000/');
            var request = new http.MultipartRequest("POST", postUri);
            request.fields['user'] = 'blah';
            var length = await sampleImage.length();
            request.files.add(new http.MultipartFile('file', 
            new http.ByteStream(DelegatingStream.typed(sampleImage.openRead())),
            length,
          filename: basename(sampleImage.path)));

            request.send().then((response) {
              if (response.statusCode == 200) print("Uploaded!");
            });
            */
            setState(() {
              data = null;
            });

            if (_option=="Object Detection"){
              print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11');
            final StorageReference firebaseStoregeRef = FirebaseStorage.instance.ref().child('yolo.jpg');
            final StorageUploadTask task = firebaseStoregeRef.putFile(sampleImage);
            var response = await http.get(
              Uri.encodeFull('http://'+ip+'/wordsfromimage/yolo.jpg'),
              headers: {
                "Accept":"application/json"
              }
            );
            setState(() {
              var extractedData = json.decode(response.body);
              data = extractedData['yolo.jpg'];
              print('##############################################33');   
              print(data[0]);    
            });
            }
            else{
            print('@@@@@@@@@@@@@@@@@@@@@@@@@@@');
            final StorageReference firebaseStoregeRef = FirebaseStorage.instance.ref().child('caption.jpg');
            final StorageUploadTask task = firebaseStoregeRef.putFile(sampleImage);
            print('@@@@@@@@@@@@@@22@@@@@@@@@@@');
            var response = await http.get(
              Uri.encodeFull('http://'+ip+'/captionbot/caption.jpg'),
              headers: {
                "Accept":"application/json"
              }
            );
            print('@@@@@@@@@@@@3333@@@@@@@@@@@@@');
            setState(() {
              var extractedData = json.decode(response.body);
              data = [ extractedData['caption.jpg'] ];
              print('##############################################33');   
              print(data[0]);    
            });



            }
            
            
            },
        ),
        new Expanded(
          child: new ListView.builder(
          itemCount: data ==null?0: data.length,
          itemBuilder: (BuildContext context, i){
            return 
            new Card(
              color: Colors.teal[200],
              elevation: 5.0,
              child:new ListTile(
                    title: new Text(data[i]),
              )
            )
            ;
          }),
        )
      ],
    )
  );
}

}


// ic_launcher.png