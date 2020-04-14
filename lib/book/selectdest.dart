import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'map_request_2.dart';

const String apiKey = "AIzaSyAZmDfNcXd5dgoSDKNKKNAKtifBhfoeYu0";
const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng DEST_LOCATION = LatLng(1.3373913, 103.6981086);

class SelectDest extends StatefulWidget {
  @override
  _MyAppState1 createState() => _MyAppState1();
}

class _MyAppState1 extends State<SelectDest> {
  Completer<GoogleMapController> _completer = Completer();
  final Set<Marker> _markers = new Set();
  final Set<Polyline> _polyLines = new Set();
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();

  Set<Polyline> get polyLines => _polyLines;
  static LatLng latLng;
  LocationData currentLocation;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getLocation() async {
    var location = new Location();
    location.onLocationChanged().listen(( currentLocation) {
      setState(() {
        latLng =  LatLng(currentLocation.latitude, currentLocation.longitude);
      });
      print(location);
      addMarker(latLng, "Init_position");
    });
  }

  addMarker(LatLng latLng, String name) async {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(name),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void handleOnPress() async {
    String route = await _googleMapsServices.getRouteCoordinates(
        apiKey, latLng, DEST_LOCATION);
    _polyLines.add(_googleMapsServices.createRoute(route, DEST_LOCATION));
    addMarker(DEST_LOCATION, "Destination");
  }

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
            Fluttertoast.showToast(msg: "Display Route");
            handleOnPress();
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
                                  hintText: "Current Location",
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
                polylines: polyLines,
                markers: _markers,
                initialCameraPosition: CameraPosition(
                  target: latLng,
                  zoom: 15.0,
                ),
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _completer.complete(controller);
                },
              )),
          Center(
            child: new Container(
              //color: Colors.grey[400],
              width: 235,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 550, 55, 15),
              alignment: Alignment.bottomCenter,
              child: new RaisedButton(
                onPressed: () async {Navigator.of(context).pushNamed('/driverMap');},
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
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker, //(,"assets/images/taxi.png"),
      ));
    });

    return _markers;
  }
}
