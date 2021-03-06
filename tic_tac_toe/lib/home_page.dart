import 'dart:math';
import 'package:flutter/material.dart';
import './game_button.dart';
import './custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override 
  _HomePageState createState() => new _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;
  List<String> _options;  
  var _option;

  @override
    void initState() {  
      super.initState();
      buttonsList = doInit();
      _options=['2 Player','RandomBot'];
      _option = _options.elementAt(0);
    }

  void _onChanged(String value){
    setState(() {
      _option=value;
    });
    print(_option);
  }

  List<GameButton> doInit(){
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    var gameButtons = <GameButton>[
      new GameButton(id:1),
      new GameButton(id:2),
      new GameButton(id:3),
      new GameButton(id:4),
      new GameButton(id:5),
      new GameButton(id:6),
      new GameButton(id:7),
      new GameButton(id:8),
      new GameButton(id:9),
    ];
    return gameButtons;
  }
 
  void playGame(GameButton gb){
    setState(() {
      if(activePlayer==1){ gb.text='X'; gb.bg=Colors.red;activePlayer=2;player1.add(gb.id); }
      else{ gb.text='O'; gb.bg=Colors.black; activePlayer=1; player2.add(gb.id); }
      gb.enabled=false;
      int winner = checkWinner();
      if (winner==-1 && buttonsList.every((p)=>p.text!='') ){
        showDialog(
          context: context,
          builder: (_)=> new CustomDialog('Game Tied','Press Reset to Play Again', resetGame)
        );
      }else{
        (activePlayer==2 && _option==_options.elementAt(1))?autoPlayZero():null;
      }      
    });
  }

  void autoPlayZero(){
    var emptyCells = List();
    var list = new List.generate(9, (i)=> i+1);
    for(var i in list){
      if(!(player1.contains(i) || player2.contains(i))) emptyCells.add(i);
    }
    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cell = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p)=>p.id==cell); 
    playGame(buttonsList[i]);
  }

  int checkWinner(){
    var winner=check(player1)?1:check(player2)?2:-1;
    if (winner==1 || winner==2){
      showDialog(
        context: context,
        builder: (_)=> new CustomDialog('Player $winner Won', 'Press Reset to Play Again', resetGame)
      );
    }
    return winner;
  }

  void resetGame(){
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList=doInit();      
    });
  }

  bool check(p){
    if(p.contains(1) && p.contains(2) && p.contains(3)) return (true); 
    if(p.contains(4) && p.contains(5) && p.contains(6)) return (true);
    if(p.contains(7) && p.contains(8) && p.contains(9)) return (true);
    if(p.contains(1) && p.contains(4) && p.contains(7)) return (true);
    if(p.contains(2) && p.contains(5) && p.contains(8)) return (true);
    if(p.contains(3) && p.contains(6) && p.contains(9)) return (true);
    if(p.contains(1) && p.contains(5) && p.contains(9)) return (true);
    if(p.contains(3) && p.contains(5) && p.contains(7)) return (true);
    return false;
  }

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child:new Text('Tic Tac Toe',style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
        actions: <Widget>[
          new DropdownButton(
            value: _option,
            items: _options.map((String value){
              return new DropdownMenuItem(
                value: value,
                child: new Text(value, style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              );
            }).toList(),
            onChanged: (value)=>_onChanged(value),
          )
        ],
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new GridView.builder(
              padding: new EdgeInsets.symmetric(vertical:50.0, horizontal: 10.0),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0 
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context,i) => new SizedBox(
                width: 100.0,
                height:100.0,
                child: new RaisedButton(
                  padding: new EdgeInsets.all(8.0),
                  onPressed: buttonsList[i].enabled?()=>playGame(buttonsList[i]):null,
                  child: new Text(buttonsList[i].text, style: new TextStyle(color: Colors.white, fontSize: 20.00)),
                  color: buttonsList[i].bg,
                  disabledColor: buttonsList[i].bg,
                )),
            )),
          new RaisedButton(
            child: new Text('Reset', style: new TextStyle(color: Colors.white, fontSize: 20.0)),
            color: Colors.red,
            padding: const EdgeInsets.all(20.0),
            onPressed: resetGame,
          )
        ])
    );
}}