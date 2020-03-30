import 'package:flutter/material.dart';

//import 'selectdest.dart';
class DouDouEat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DouDou Eat"),
        backgroundColor: Colors.brown[600],
      ),
      body: Center(
          child: new Icon(
            Icons.fastfood,
            color: Colors.green,
            size: 200,
          ),
      ),
    );
  }
}