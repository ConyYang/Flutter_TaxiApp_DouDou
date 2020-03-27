import 'package:flutter/material.dart';
class FreeRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Rides"),
        backgroundColor: Colors.brown[600],
      ),
      body: new Column(
        children: <Widget>[
          new Row(children: <Widget>[
            new Container(
                width: 300.0,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: new Text("Send yours friends",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 32.0)))),
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Text("free rides",
                        style: new TextStyle(
                            color: Colors.black, fontSize: 32.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: new Text("Share the DouDou love and give friends free",
                        style:
                        new TextStyle(color: Colors.grey, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    //TODO: Replase Rs with ruppes
                    child: new Text("rides to try DouDou,worth up to 25SGD each!",
                        style:
                        new TextStyle(color: Colors.grey, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: new Text("How Invites Works",
                        style:
                        new TextStyle(color: Colors.orangeAccent[400], fontSize: 16.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: new Image.asset(
                      'android/assets/friend.jpg',
                      width: 350,
                      height: 200,
                    )))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Text("Share Your Invite Code",
                        style:
                        new TextStyle(color: Colors.orangeAccent[300], fontSize: 16.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                margin: EdgeInsets.fromLTRB(20, 10, 0, 5),
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: new Row(children: <Widget>[
                  new Text(
                    "wmp98it                                             ",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.share)),
                ]))
          ]),
          new Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                child: new Container(
                    color: Colors.black,
                    width: 320,
                    child: new RaisedButton(
                      onPressed: () {
//                        AdvancedShare.whatsapp(
//                            msg:
//                                "I'm giving you a free ride on the Uber app (up to Rs. 25). To accept, use code 'wmp9it' to sign up. Enjoy! Details https://www.uber.com/invite/wmp9it"
//                        ).then((response){handleResponse(response,appName:"Whatsapp");});
//                        //TODO: replace Rs.
//                        FlutterShareMe().shareToWhatsApp(
//                            msg:
//                                "I'm giving you a free ride on the Uber app (up to Rs. 25). To accept, use code 'wmp9it' to sign up. Enjoy! Details https://www.uber.com/invite/wmp9it");
                      },
                      textColor: Colors.white,
                      color: Colors.green[600],
                      child: new Text(
                        "WHATSAPP",
                        textAlign: TextAlign.center,
                        style:
                        new TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    )))
          ]),
        ],
      ),
    );
  }
}