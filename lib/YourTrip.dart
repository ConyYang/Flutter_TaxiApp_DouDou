import 'package:flutter/material.dart';

class YourTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a trip"),
        backgroundColor: Colors.brown[600],
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