import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class selectDest extends StatefulWidget {
  @override
  _MyAppState1 createState() => _MyAppState1();
}

class _MyAppState1 extends State<selectDest> {
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
              "Select Destination",
            )),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.location_searching,
            color: Colors.lightGreen,
          ),
          onPressed: () {
            Fluttertoast.showToast(msg: "Location Click");
          },
          backgroundColor: Colors.white,
        ),
        body: Stack(children: <Widget>[
          Container(
              height: 120,
              width: 370,
              color: Colors.white,
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
                                  hintText: "Nanyang Avenue 24",
                                  icon: Icon(Icons.add_location, color: Colors.greenAccent,)),
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
                                      Icons.stars,
                                      color: Colors.deepOrange,
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
                  'android/assets/taxi.png',
                  height: 90,
                  width: 40,
                ),
              )),
          Center(
            child: new Container(
              //color: Colors.grey[400],
              width: 235,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 550, 55, 15),
              alignment: Alignment.bottomCenter,
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/driverMap");
                },
                textColor: Colors.white,
                color: Colors.deepOrange[800],
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
