import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'MyDialog.dart';

class booking extends StatefulWidget {
  @override
  _bookingState createState() => _bookingState();

}
//create google map class
class _bookingState extends State<booking> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(19.0737446, 72.8994785);

  var _date = DateFormat("EEEE, MMM d").format(new DateTime.now());
  var _time =
  TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  var timet = DateFormat("jm").format(new DateTime.now());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('DouDou Booking'),
        backgroundColor: Colors.brown[600],
      ),
      body: Stack(
          children: <Widget>[
            new Container(
              // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              margin: EdgeInsets.only(top: 80, right: 10),
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
                              padding: EdgeInsets.fromLTRB(0, 6, 0, 15),
                              child: new Text("Good evening , Yubei",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      color: Colors.brown[900],
                                      backgroundColor: Colors.white,
                                      fontSize: 25.0,
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
                                  color: Color.fromRGBO(239, 239, 239, 1.0),
//                                  color: Colors.grey,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/SelectDest");
                                    },
                                    child: Text(
                                      "Where you going?",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                    fillColor:
                                    Color.fromRGBO(255, 165, 0, 1.0),
                                  )))),
                      new Container(
                          color: Colors.white,
                          height: 60.0,
                          width: 160.0,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(2, 0, 20, 15),
                              child: new Container(
                                  height: 60,
                                  width: 132,
                                  child: RawMaterialButton(
                                    onPressed: () async {
                                      await _dialogCall(context);
                                    },
                                    child: Text(
                                      "Schedule ",
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
                                    fillColor: Colors.lightGreen[600],
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
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                    FontWeight.bold))),
                                        Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: new Text("NTU HALL 9",
                                                textAlign: TextAlign.start,
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  fontSize: 14.0,
//                                                fontWeight: FontWeight.bold
                                                ))),
                                      ]))
                                ])
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
                                    fillColor: Colors.lightGreen[600],
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
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                    FontWeight.bold))),
                                        Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: new Text("Huawei Ltd.  ",
                                                textAlign: TextAlign.start,
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  fontSize: 14.0,
//                                                fontWeight: FontWeight.bold
                                                ))),
                                      ]))
                                ])
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
                              fillColor: Colors.amber[400],
                            ),
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
          ]),
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
