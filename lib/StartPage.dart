import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class StartPage extends StatelessWidget {
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