import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'map_request.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
const apiKey = "AIzaSyAZmDfNcXd5dgoSDKNKKNAKtifBhfoeYu0";

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(1.344152,103.6778873);

class TripData {
  final LatLng location;
  final int timeStatus;

  TripData({this.location, this.timeStatus});

  factory TripData.fromJson(Map<String, dynamic> json) {
    return TripData(
      location: LatLng(json['location'][0], json['location'][1]),
      timeStatus: json['time']
    );
  }
}

class YourTrip extends StatefulWidget {
  @override
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  YourTrip ({this.onPressed, this.tooltip, this.icon});
  State<YourTrip> createState() => YourTripState();
}

class YourTripState extends State<YourTrip> with SingleTickerProviderStateMixin {
  BitmapDescriptor pinLocationIcon;
  bool loading = true;
  bool flagFetchTripData = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  Set<Polyline> get polyLines => _polyLines;
  Completer<GoogleMapController> _controller = Completer();
  static LatLng latLng;
  LocationData currentLocation;
  TripData destination_data;

  ImageConfiguration get configuration => null;

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;



  @override
  void initState(){
    getLocation();

    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));

    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'android/assets/destination_map_marker.png');
  }

  Future<TripData> fetchTripInfo(context) async {
    final String data = await DefaultAssetBundle.of(context).loadString("android/assets/data.json");
    setState(() {
      destination_data = TripData.fromJson(json.decode(data)['data']);
      flagFetchTripData = false;
    });
  }


  getLocation() async {

    var location = new Location();
    location.onLocationChanged().listen((  currentLocation) {
      setState(() {
        latLng =  LatLng(currentLocation.latitude, currentLocation.longitude);
      });

      _onAddMarkerButtonPressed();
      loading = false;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("111"),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void onCameraMove(CameraPosition position) {
    latLng = position.target;
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  void sendRequest(LatLng source, LatLng destination) async {
    String route = await _googleMapsServices.getRouteCoordinates(
        apiKey, source, destination);
    createRoute(route);
    _addMarker(destination, "Your Driver is Here");
  }

  void createRoute(String encondedPoly) {
    _polyLines.add(Polyline(
        polylineId: PolylineId(latLng.toString()),
        width: 4,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.greenAccent));
  }

  void _addMarker(LatLng location, String address) {
    _markers.add(Marker(
        markerId: MarkerId("112"),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "call him"),
        icon: pinLocationIcon));
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }
  Widget talk() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: null,
        tooltip: 'Talk',
        child: Icon(Icons.speaker_notes,color: Colors.white,),
      ),
    );
  }

  Widget cancel() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
                children:[
                  new Container(
                    child: new Image.asset(
                      'android/assets/cryFace.png',
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text('   Cancel Booking   ')
                ]
            ),
            content: Text("Are you sure to cancel? \n"
                "You may be chanrged."),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel Anyway"),
                onPressed: () {
                  //Put your code here which you want to execute on Cancel button click.
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Continue Booking"),
                onPressed: () {
                  //Put your code here which you want to execute on Cancel button click.
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
            },
          );
        },
        tooltip: 'Cancel',
        child: Icon(Icons.cancel),
      ),
    );
  }

  Widget showDistance() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Row(
                    children:[
                new Container(
                          child: new Image.asset(
                            'android/assets/Huang.jpg',
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Text('   SFU13G   ')
                    ]
                ),
                content: Text("The Driver is arriving in 5 minutes \n"
                    "CAR BRAND: Chevrolet A6"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      //Put your code here which you want to execute on Cancel button click.
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Inbox',
        child: Icon(Icons.access_alarms),
      ),
    );
  }

  Widget carLocation() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: (){sendRequest(latLng, destination_data.location);},
        tooltip: 'CarLocation',
        child: Icon(Icons.directions_car),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    if (flagFetchTripData) {
      fetchTripInfo(context);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Check trip"),
          backgroundColor: Colors.brown[600],
        ),
        body: Container(
        child: Stack(
          children: <Widget>[
            new Container(
              child:
              GoogleMap(
                polylines: polyLines,
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: latLng,
                  zoom: 14.4746,
                ),
                onCameraMove:  onCameraMove,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * 4.0,
                    0.0,
                  ),
                  child: carLocation(),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * 3.0,
                    0.0,
                  ),
                  child: talk(),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value * 2.0,
                    0.0,
                  ),
                  child: showDistance(),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    0.0,
                    _translateButton.value,
                    0.0,
                  ),
                  child: cancel(),
                ),
                toggle(),
              ],
            ),
          ],
           ),
        )
    );
  }
}
