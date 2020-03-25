import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ubersample.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        routes: {
          "/Home": (context) => new MyApp1(),
          "/SelectDest": (context) => new MyApp3(),
          "/Book": (context) => new Book(),
//          "/Home": (context) => new MyApp(),
        },
        home: new MyApp3());
  }
}

class MyApp3 extends StatefulWidget {
  @override
  _MyAppState1 createState() => _MyAppState1();
}

class _MyAppState1 extends State<MyApp3> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(19.0737446, 72.8994785);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Select Destination",
            )),
//        floatingActionButtonLocation: FloatingActionButtonLocation(child),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.location_searching,
            color: Colors.black,
          ),
          onPressed: () {
            Fluttertoast.showToast(msg: "Location Click");
          },
          backgroundColor: Colors.white,
        ),
        body: Stack(children: <Widget>[
          Container(
              height: 120,
              width: 360,
              color: Colors.white,
//                  margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.topCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        height: 60.0,
                        width: 360.0,
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                            child: new TextField(
                              decoration: InputDecoration(
                                  hintText: "K. J. Somaiya Vidyavihar",
                                  icon: Icon(Icons.stop)),
                            ))),
                    Row(children: <Widget>[
                      new Container(
                          height: 60.0,
                          width: 360.0,
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: new TextField(
                                decoration: InputDecoration(
                                    hintText: "Enter Destination",
                                    icon: Icon(
                                      Icons.stop,
                                      color: Colors.black,
                                    )),
                              ))),
                    ])
                  ])),
          Container(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              height: 700,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _mainLocation,
                  zoom: 15.0,
                ),
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {
                    myMapController = controller;
                  });
                },
              )),
          Center(
              child: new Container(
                child: Image.asset(
                  'assets/images/pin4.png',
                  height: 90,
                  width: 40,
                ),
              )),
          Center(
            child: new Container(
              color: Colors.black,
              width: 235,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 550, 55, 15),
              alignment: Alignment.bottomCenter,
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Book");
                },
                textColor: Colors.white,
                color: Colors.black,
                child: new Text(
                  "DONE",
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ]));
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        icon: BitmapDescriptor.defaultMarker, //(,"assets/images/taxi.png"),
      ));
    });

    return _markers;
  }
}

class Book extends StatefulWidget {
  @override
  _MyAppState7 createState() => _MyAppState7();
}

class _MyAppState7 extends State<Book> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(19.0737446, 72.8994785);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Book Ride",
          )),
      body: Stack(
//
          children: <Widget>[
            new Container(
//                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                        child: new Text("Choose a ride",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.black,
                                backgroundColor: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold))),
                    new Row(children: <Widget>[
                      new Container(
//                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: 90.0,
                          width: 90.0,
//                          color: Colors.black,

                          child: Image.asset(
                            'assets/images/cab.png',
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
                                  child: Text("     UberXL        ",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text("10:30pm      ",
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
                          width: 60.0,
//                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text("252.00 ",
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
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: 90.0,
                          width: 90.0,
//                          color: Colors.black,

                          child: Image.asset(
                            'assets/images/cab.png',
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
                                  child: Text("     UberGO        ",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text("12:35pm      ",
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
                          width: 60.0,
//                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text("114.32 ",
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

//                          color: Colors.black,

                          child: Image.asset(
                            'assets/images/cab.png',
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
                                  child: Text("     Premier        ",
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text("12:41pm      ",
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
                          width: 60.0,
//                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text("138.89 ",
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
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),

//                          color: Colors.black,

                            child: Image.asset(
                              'assets/images/cash.png',
                              height: 40,
                              width: 40,
                            )),
                        new Container(
                            color: Colors.white,
                            height: 60.0,
                            width: 60.0,
//                          alignment: Alignment.centerRight,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text("Cash ",
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontSize: 18.0,
                                    )))),
                        new Container(
                            color: Colors.white,
                            height: 60.0,
                            width: 60.0,
//                          alignment: Alignment.centerRight,
                            margin: EdgeInsets.fromLTRB(175, 0, 0, 0),
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
                              color: Colors.black,
                              child: new Text(
                                "CONFIRM UBER",
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
                                      side: BorderSide(color: Colors.black)),
                                  child: new Icon(
                                    Icons.watch_later,
                                    color: Colors.black,
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