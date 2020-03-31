import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'map_request.dart';

const apiKey = "AIzaSyAZmDfNcXd5dgoSDKNKKNAKtifBhfoeYu0";

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(1.344152,103.6778873);
const LatLng DEST_LOCATION = LatLng(1.3425827,103.6909927);

class YourTrip extends StatefulWidget {
  @override
  State<YourTrip> createState() => YourTripState();
}

class YourTripState extends State<YourTrip> {
  BitmapDescriptor pinLocationIcon;
  bool loading = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  Set<Polyline> get polyLines => _polyLines;
  Completer<GoogleMapController> _controller = Completer();
  static LatLng latLng;
  LocationData currentLocation;

  ImageConfiguration get configuration => null;

  @override
  void initState(){
    getLocation();
    loading = true;
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'android/assets/destination_map_marker.png');
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
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Check trip"),
        backgroundColor: Colors.brown[600],
      ),
      body:
      loading
          ?
      Container(color: Colors.green,)
          :
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

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          sendRequest(latLng, DEST_LOCATION);
        },
        label: Text('View Driver Position'),
        icon: Icon(Icons.directions_car),
      ),
    );
  }
}
