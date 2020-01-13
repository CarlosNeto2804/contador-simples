import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: 'Contador de Pessoas',
      debugShowCheckedModeBanner: false,
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people=0;
  String _message="Pode Entrar";
  void _changePeople(int number){
    setState(() {
       _people+=number;
      if(_people<0){
        _message = "Como Assim?!";
      }else if(_people<=10){
        _message="Pode Entrar";
      }else{
        _message="Lotado!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/bg.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_people',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        '+1',
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      },
                    )),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      '-1',
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                )
              ],
            ),
            Text(
              _message,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        ),
      ],
    );
  }
}
