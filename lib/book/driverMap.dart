import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class driverMap extends StatefulWidget {
  @override
  driverMapState createState() => driverMapState();
}

class driverMapState extends State<driverMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        /*leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
            }),*/
        title: Text("Select Driver"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                Navigator.of(context).pushNamed('/confirmBook');
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color: Colors.orange[800]),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color: Colors.orange[800]),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "android/assets/Huang.jpg",
                  1.3508040,103.6912919,"Huang Ting Liang", "4.5", "132 rides","Male", "Talkative", "English"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "android/assets/Lin.jpg",
                  1.3508542, 103.6822742,"Lin Wei Fang","4.8", "302 rides","Female", "Talkative", "Malaysian"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "android/assets/Luo.jpg",
                  1.3500121, 103.6938683,"Luo Jinqi","4.0","289 rides","Male", "NotTalkative", "Chinese"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "android/assets/Ong.jpg",
                  1.3447367,103.6912919, "Ong Hui Se","4.0","289 rides","Male", "NotTalkative", "Japanese"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String driverName, rate,
      rides, sex, talkative,language) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(driverName, rate, rides, sex, talkative, language),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String rate, String rides, String sex, String talkative, String language) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Colors.green[600],
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      rate,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 22.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 22.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 22.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 22.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStarHalf,
                    color: Colors.amber,
                    size: 22.0,
                  ),
                ),
                Container(
                    child: Text(
                      sex,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              rides,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
             talkative,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              language,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {huangMarker, LinMarker,luoMarker, OngMarker},
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}


Marker huangMarker = Marker(
  markerId: MarkerId('Huang'),
  position: LatLng(1.3508040,103.6912919),
  infoWindow: InfoWindow(title: 'Huang Ting Liang'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker LinMarker = Marker(
  markerId: MarkerId('Lin'),
  position: LatLng(1.3508542, 103.6822742),
  infoWindow: InfoWindow(title: 'Lin Wei Fang'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
Marker luoMarker = Marker(
  markerId: MarkerId('Luo Jinqi'),
  position: LatLng(1.3500121, 103.6938683),
  infoWindow: InfoWindow(title: 'Luo Jinqi'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker OngMarker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(1.3447367,103.6912919),
  infoWindow: InfoWindow(title: 'Ong Hui Se'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
