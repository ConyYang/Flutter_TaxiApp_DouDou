//import 'package:color/color.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import 'selectdest.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        routes: {
          "/Help": (context) => new HelpScreen(),
          "/Trip": (context) => new YourTrip(),
          "/Payment": (context) => new Payment(),
          "/Setting": (context) => new Settings(),
          "/FreeRides": (context) => new FreeRides(),
          "/SelectDest": (context) => new MyApp3(),
          "/Home": (context) => new MyApp(),
          "/Book": (context) => new Book(),
          "/Food": (context) => new UberEat()
        },
        home: new MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
/*
Code for ScheduleDialog
 () async {
  await _dialogCall(context);
  },
 */

//create google map class
class _MyAppState extends State<MyApp> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(19.0737446, 72.8994785);

  var _date = DateFormat("EEEE, MMM d").format(new DateTime.now());
  var _time =
  TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  var timet = DateFormat("jm").format(new DateTime.now());

  //   TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

//  var _time = DateFormat.jm();
//  var _time=  ;

//  static var screensize = size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
//
          children: <Widget>[
            new Container(
//                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 290,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _mainLocation,
                    zoom: 17.0,
                  ),
                  markers: this.myMarker(),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      myMapController = controller;
                    });
                  },
                )),
            Container(
//                  margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.bottomCenter,

              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Row(children: <Widget>[
                      new Container(
                          height: 60.0,
                          width: 360.0,
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: new Text("Good evening , Sohil",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold))))
                    ]),
                    new Row(children: <Widget>[
                      new Container(
//                          color: Colors.white,
                          height: 60.0,
                          width: 225.0,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
                              child: new Container(
                                  height: 60,
                                  width: 115,
//                                  color: Color.fromRGBO(239, 239, 239, 1.0),

//                                  color: Colors.grey,
                                  child: RawMaterialButton(
//                                    textColor: Colors.black,
//                                        height: 1.0,
//                                    color: Color.fromRGBO(239, 239, 239, 1.0),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/SelectDest");
                                    },
                                    child: Text(
                                      "Where to  ?",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                    fillColor:
                                    Color.fromRGBO(239, 239, 239, 1.0),
                                  )))),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 135.0,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(2, 0, 20, 15),
                              child: new Container(
                                  height: 60,
                                  width: 132,
//                                  color: Colors.green,
                                  child: RawMaterialButton(
//                                    textColor: Colors.white,
//                                    color: Colors.black,
//                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    onPressed: () async {
                                      await _dialogCall(context);
                                    },

                                    child: Text(
                                      "Schedule",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                    fillColor:
                                    Color.fromRGBO(239, 239, 239, 1.0),
                                  )))),
                    ]),
                    new Row(
                      children: <Widget>[
                        new Container(
                            alignment: Alignment.bottomLeft,
                            color: Colors.white,
                            height: 70.0,
                            width: 360.0,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: new Row(children: <Widget>[
                                  RawMaterialButton(
                                    onPressed: null,
                                    child: IconTheme(
                                        data:
                                        IconThemeData(color: Colors.white),
                                        child: Icon(Icons.home)),
                                    shape: CircleBorder(),
                                    fillColor: Colors.grey,
                                  ),
                                  new GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg: "Home clicked");

                                        Navigator.pushNamed(
                                            context, "/SelectDest");
                                      },
                                      child: new Column(children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: new Text("Home        ",
                                                textAlign: TextAlign.left,
                                                style: new TextStyle(
                                                    color: Colors.black,
                                                    backgroundColor:
                                                    Colors.white,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                    FontWeight.bold))),
                                        Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: new Text("Ghatkopar",
                                                textAlign: TextAlign.start,
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  fontSize: 14.0,
//                                                fontWeight: FontWeight.bold
                                                ))),
                                      ]))
                                ])

//                                FlatButton.icon(
//                                    onPressed: null,
//                                    icon: Icon(Icons.home),
//                                    label: Text(
//                                      "Home",
//                                      textAlign: TextAlign.start,
//                                      style: new TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 18.0,
//                                          fontWeight: FontWeight.bold),
//                                    ))
//
                            )),
                      ],
                    ),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    new Row(
                      children: <Widget>[
                        new Container(
                            alignment: Alignment.bottomLeft,
                            color: Colors.white,
                            height: 70.0,
                            width: 360.0,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: new Row(children: <Widget>[
                                  RawMaterialButton(
                                    onPressed: null,
                                    child: IconTheme(
                                        data:
                                        IconThemeData(color: Colors.white),
                                        child: Icon(Icons.work)),
                                    shape: CircleBorder(),
                                    fillColor: Colors.grey,
                                  ),
                                  new GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg: "Work clicked");

                                        Navigator.pushNamed(
                                            context, "/SelectDest");
                                      },
                                      child: new Column(children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: new Text("Work        ",
                                                textAlign: TextAlign.start,
                                                style: new TextStyle(
                                                    color: Colors.black,
                                                    backgroundColor:
                                                    Colors.white,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                    FontWeight.bold))),
                                        Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: new Text("Mumbai  ",
                                                textAlign: TextAlign.start,
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  fontSize: 14.0,
//                                                fontWeight: FontWeight.bold
                                                ))),
                                      ]))
                                ])

//                                FlatButton.icon(
//                                    onPressed: null,
//                                    icon: Icon(Icons.home),
//                                    label: Text(
//                                      "Home",
//                                      textAlign: TextAlign.start,
//                                      style: new TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 18.0,
//                                          fontWeight: FontWeight.bold),
//                                    ))
//
                            )),
                      ],
                    ),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    new Row(
                      children: <Widget>[
                        new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 180.0,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: RawMaterialButton(
                              onPressed: () {},
                              child: IconTheme(
                                  data: IconThemeData(color: Colors.white),
                                  child: Icon(Icons.local_taxi)),
                              shape: CircleBorder(),
                              fillColor: Colors.black,
                            ),
//                            FlatButton.icon(
//                                onPressed: null,
//                                icon: Icon(Icons.local_taxi),
//                                label: Text(
//                                  "Ride",
//                                  textAlign: TextAlign.start,
//                                  style: new TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 18.0,
//                                      fontWeight: FontWeight.bold),
//                                )),
                          ),
                        ),
                        new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 180.0,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: RawMaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/Food");
                              },
                              child: IconTheme(
                                  data: IconThemeData(color: Colors.grey),
                                  child: Icon(Icons.restaurant)),
                              shape: CircleBorder(),
//                              fillColor: Colors.black,
                            ),
//
//                            FlatButton.icon(
//                                onPressed: null,
//                                icon: Icon(Icons.restaurant),
//                                label: Text(
//                                  "Order Food",
//                                  textAlign: TextAlign.start,
//                                  style: new TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 18.0,
//                                      fontWeight: FontWeight.bold),
//                                )),
                          ),
                        )
                      ],
                    ),
                    new Row(children: <Widget>[
                      new Container(
                          color: Colors.white,
                          height: 15.0,
                          width: 200.0,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                              child: new Container(
                                height: 15.0,
                                width: 180,
//                                  color: Colors.grey,
                                child: Text(
                                  "Ride",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))),
                      new Container(
                          color: Colors.white,
                          height: 15.0,
                          width: 160.0,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                              child: new Container(
                                height: 15,
                                width: 160,
//                                  color: Colors.green,
                                child: Text(
                                  "Order Food",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ))),
                    ]),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                  ]),
            ),
//                FloatingActionButton(
//                  onPressed: () {
//                    Fluttertoast.showToast(
//                        msg: "Help clicked",
//                        toastLength: Toast.LENGTH_LONG,
//                        gravity: ToastGravity.CENTER,
//                        backgroundColor: Colors.blue,
//                        textColor: Colors.red,
//                        fontSize: 20.0);
//                  },
//                ),
          ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 250.0,
              child: DrawerHeader(
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            backgroundImage: new NetworkImage(
                                'https://i.ibb.co/jDvLWGV/user.png'),
                            backgroundColor: Colors.white,
                            radius: 30.0,
                          ),
                        ),
                        new Container(
                          child: new Text(
                            "    Sohil Luhar",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                        )
                      ],
                    ),
                    new Row(children: <Widget>[
                      new Container(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: new Text("Do more with your account",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 14.0))))
                    ]),
                    new Row(children: <Widget>[
                      new Container(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: new Text("Make money driving",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 14.0))))
                    ])
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Your Trips',
                style: new TextStyle(fontSize: 22),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, "/Trip");
              },
            ),
            ListTile(
              title: Text(
                'Help',
                style: new TextStyle(fontSize: 22),
              ),
              onTap: () {
//                    // Update the state of the
//                    Fluttertoast.showToast(
//                        msg: "Help clicked",
//                        toastLength: Toast.LENGTH_LONG,
//                        gravity: ToastGravity.CENTER,
//                        backgroundColor: Colors.blue,
//                        textColor: Colors.red,
//                        fontSize: 20.0);
                Navigator.pushNamed(context, "/Help");

                // Then close the drawer
              },
            ),
            ListTile(
              title: Text(
                'Payment',
                style: new TextStyle(fontSize: 22),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pushNamed(context, "/Payment");
              },
            ),
            ListTile(
              title: Text(
                'Free Rides',
                style: new TextStyle(fontSize: 22),
              ),
              onTap: () {
                // Update the state of the app
                // ...

                Navigator.pushNamed(context, "/FreeRides");
                // Then close the drawer
//                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: new TextStyle(fontSize: 22),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pushNamed(context, "/Setting");
              },
            ),
//            Expanded(
//              child: new Align(
//                alignment: Alignment.bottomRight,
//                child: Text('Get Food Delivery',style: new TextStyle(
//                    fontSize: 22
//                ),)
//                ,
//              ),
//            )
          ],
        ),
      ),
    );
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

  Future<void> _dialogCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog();
        });
  }
}

//display alertbox

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  var _date = DateFormat("EEEE, MMM d").format(new DateTime.now());
  var _time =
  TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  var timet = DateFormat("jm").format(new DateTime.now());

  /*

       context: context,
                                          builder: (BuildContext context) {
                                          });

   */
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: AlertDialog(
          content: Form(
            child: Container(
                height: 250,
                width: 400,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Text(
                          "Schedule a Ride",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 24.0, color: Colors.black),
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: new GestureDetector(
                          child: Text(
                            "$_date",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 24.0, color: Colors.black),
                          ),
                          onTap: () async {
//
                            final DateTime pick = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2017),
                                lastDate: DateTime(2021));
                            if (pick != null && pick != _date) {
                              setState(() {
                                _date = DateFormat("EEEE, MMM d").format(pick);
                                //'${pick.weekday}, ${pick.month} ${pick.day}';
                              });
                              print("Date is " + _date);
                            }
                          },
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: new GestureDetector(
                          child: Text(
                            "$timet",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 24.0, color: Colors.black),
                          ),
                          onTap: () async {
                            final TimeOfDay pick = (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ));

//

                            setState(() {
                              var _timetmp = TimeOfDay(
                                  hour: pick.hour, minute: pick.minute);
                              final now = DateTime.now();
                              final selectedTime = new DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  _timetmp.hour,
                                  _timetmp.minute);
                              timet = DateFormat("jm").format(selectedTime);

                              //'${pick.weekday}, ${pick.month} ${pick.day}';
                            });
                            print("Date is " + _date);
                          },
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        color: Colors.black,
                        width: 350,
                        height: 50,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        child: new RaisedButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Ride is scheduled");
                            Navigator.pop(context);
                          },
                          textColor: Colors.white,
                          color: Colors.black,
                          child: new Text(
                            "SET PICKUP TIME",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                        ))
                  ],
                )),
          ),
        ));
  }
}

//drawer menu here

//display HelpScreen
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

class FreeRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Rides"),
      ),
      body: new Column(
        children: <Widget>[
          new Row(children: <Widget>[
            new Container(
                width: 360.0,
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
                    child: new Text("Share the Uber love and give friends free",
                        style:
                        new TextStyle(color: Colors.grey, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    //TODO: Replase Rs with ruppes
                    child: new Text("rides to try Uber,worth up to Rs 25 each!",
                        style:
                        new TextStyle(color: Colors.grey, fontSize: 18.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: new Text("How Invites Works",
                        style:
                        new TextStyle(color: Colors.blue, fontSize: 16.0))))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: new Image.asset(
                      'assets/images/friend.jpg',
                      width: 350,
                      height: 280,
                    )))
          ]),
          new Row(children: <Widget>[
            new Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Text("Share Your Invite Code",
                        style:
                        new TextStyle(color: Colors.grey, fontSize: 16.0))))
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
                      color: Colors.grey,
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
                      color: Colors.black,
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

class YourTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a trip"),
      ),
      body: Center(
        child: new Text(
          "You haven't taken a trip yet.",
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Center(
        child: new Text(
          "Payment Page",
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Center(
        child: new Text(
          "Setting Page",
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
}

class UberEat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uber Eat"),
      ),
      body: Center(
          child: new Icon(
            Icons.fastfood,
            color: Colors.green,
            size: 200,
          )),
    );
  }
}