import 'package:flutter/material.dart';
class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: new Column(
        children: <Widget>[
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: new Text("All Topics",
                        style:
                        new TextStyle(color: Colors.grey, fontSize: 14.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: new Text("Trips Issues and Refunds",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 30),
                    child: new Text("Account Payment Options",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 30, 30),
                    child: new Text("More",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 30, 30),
                    child: new Text("A Guide to Uber",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 30, 30),
                    child: new Text("Signing Up",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 30, 30),
                    child: new Text("Accessibility",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 18.0))))
          ]),
        ],
      ),
    );
  }
}