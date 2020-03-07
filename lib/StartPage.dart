import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage ({Key key, this.title}) :super(key: key);
  final String title;
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>  {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("android/assets/HomePage.jpg"), fit: BoxFit.cover,),
              ),
            ),
            new Container(
                margin: const EdgeInsets.only(top:550,left: 120),
                child: Column(
                  children: <Widget>[
                    new RaisedButton(
                      elevation: 10,
                      color: Colors.white,
                      textColor: Colors.blueGrey,
                      splashColor: Colors.yellowAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        'Hello DouDou',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                      onPressed: () {
                        print("Pressed on a RaisedButton");
                        Navigator.of(context).pushNamed('/Login'); //route
                      },
                    ),
                  ],
                )
            )
          ],
        )
    );
  }
}