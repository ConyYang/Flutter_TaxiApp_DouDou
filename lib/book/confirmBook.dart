
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MyDialog.dart';
import 'package:intl/intl.dart';

class confirmbook extends StatefulWidget {
  @override
  _confirmState createState() => _confirmState();
}

class _confirmState extends State<confirmbook> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(19.0737446, 72.8994785);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.brown[600],
          title: Text(
            "Book Ride",
          )),
      body: Stack(
          children: <Widget>[
            new Container(
                height: 220,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _mainLocation,
                    zoom: 15.0,
                  ),
//    markers: this.myMarker(),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      myMapController = controller;
                    });
                  },
                )),
            Container(
//                  margin: EdgeInsets.only(top: 80, right: 10),
//              alignment: Alignment.topCenter,
//              color: Colors.green,
              alignment: Alignment.bottomCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Text("Choose a driver",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.deepOrange[400],
                                backgroundColor: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold))),
                    new Row(children: <Widget>[
                      new Container(
//                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: 90.0,
                          width: 90.0,
//                          color: Colors.black,
                          child: Image.asset(
                            'android/assets/luo.jpg',
                            height: 90,
                            width: 90,
                          )),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 120.0,
//                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(" Luo Yong Hao",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text("Score: 5.0",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 80.0,
//                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text("Talkative",
                                  textAlign: TextAlign.right,
                                  style: new TextStyle(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold))))
                    ]),
                    new Row(children: <Widget>[
                      new Container(
//                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB( 10, 0, 0, 0),
                          height: 90.0,
                          width: 90.0,
//                          color: Colors.black,
                          child: Image.asset(
                            'android/assets/lin.jpg',
                            height: 90,
                            width: 90,
                          )),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 120.0,
//                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text("Lin Wei Han",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text("Score: 4.7",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 80.0,
//                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text("Not talkative ",
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold))))
                    ]),
                    new Row(children: <Widget>[
                      new Container(
//                          color: Colors.white,
                          height: 90.0,
                          width: 90.0,
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Image.asset(
                            'android/assets/huang.jpeg',
                            height: 90,
                            width: 90,
                          )),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 120.0,
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text("Huang Ting",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text("Score: 4.8",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 80.0,
//                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Text("Not talkative",
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold))))
                    ]),
                    new Row(
                      children: <Widget>[
                        new Container(
                            height: 50.0,
                            width: 270.0,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: new FlatButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg:
                              "Set up Payment Details");
                          Navigator.pushNamed(context, "/Payment");
                        },
                        textColor: Colors.black,
                        color: Colors.white,
                        child: new Text("Select payment Type",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          fontSize: 18.0,
                        ),),
                      ),
                        ),
                        new Container(
                            color: Colors.white,
                            height: 60.0,
                            width: 30.0,
//                          alignment: Alignment.centerRight,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                )))
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                            height: 50.0,
                            width: 270.0,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 10),

//                          color: Colors.black,

                            child: new RaisedButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                    "Thank You for choosing Uber ,Your ride will arrive very soon");
                                Navigator.pushNamed(context, "/Home");
                              },
                              textColor: Colors.white,
                              color: Colors.deepOrange[800],
                              child: new Text(
                                "CONFIRM DouDou",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            )),
                        new Container(
                            color: Colors.white,
                            height: 50.0,
                            width: 60.0,
//                          alignment: Alignment.centerRight,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: new RaisedButton(
                                  onPressed: () async {
                                    await _dialogCall(context);
                                  },
                                  textColor: Colors.black,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.grey[400])),
                                  child: new Icon(
                                    Icons.watch_later,
                                    color: Colors.lime[800],
                                  ),
                                )))
                      ],
                    ),
                  ]),
            ),
          ]),
    );
  }

  Future<void> _dialogCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog();
        });
  }
}
