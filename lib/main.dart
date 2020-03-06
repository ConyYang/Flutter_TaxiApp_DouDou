// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:singtaxi/route_generator.dart';
import 'package:singtaxi/StartPage.dart';
import 'route_generator.dart';

void main() => runApp(MyApp());

//route of whole app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "DouDou",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
        home: Scaffold(
          appBar: AppBar(title: Text("DouDou"),
            backgroundColor: Colors.brown[600],
          ),

          body: StartPage(),
        )
    );
  }
}