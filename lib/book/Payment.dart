import 'package:flutter/material.dart';
class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.brown[600],
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