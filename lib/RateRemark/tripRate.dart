import 'package:flutter/material.dart';
import 'package:singtaxi/RateRemark/FadeAnimation.dart';
import 'package:singtaxi/RateRemark/remark.dart';

class TripRatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown[600],
        title: Text("Trip Rate", style: TextStyle(color: Colors.white, fontSize: 25),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              FadeAnimation(1.5, makeItem(image: '', tag: 'red', context: context, imageString: "android/assets/Lin.jpg",
                  date: "2020.4.2",place: "Westwood Secondary School -- Unity Center", price: "25.70")),
              FadeAnimation(1.6, makeItem(image: '', tag: 'blue', context: context, imageString:"android/assets/Luo.jpg",
                  date: "2020.3.30",place: "Bukit Timah -- Botanic Garden", price: "10.95")),
              FadeAnimation(1.7, makeItem(image: '', tag: 'white', context: context, imageString:"android/assets/Ong.jpg",
                  date: "2020.2.21",place: "Punggol -- Changi Beach Park", price: "19.00")),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, context, String imageString, String date, String place, String price}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed('/Remark');
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.lightGreen[100],
                    blurRadius: 10,
                    offset: Offset(0, 10)
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1, Text(date, style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        FadeAnimation(1.1, Text(place, style: TextStyle(color: Colors.black, fontSize: 20),)),

                      ],
                    ),
                  ),
                  FadeAnimation(1.2,
                      new Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: new AssetImage(imageString)),
                          )
                      )),
                ],
              ),
              FadeAnimation(1.2, Text(price + "\$", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}