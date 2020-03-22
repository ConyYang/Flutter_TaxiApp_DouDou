import 'package:flutter/material.dart';
import 'package:singtaxi/screens/authenticate/LoginPage.dart';
import 'package:singtaxi/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLoginPage = true;

  void toggleView() {
    setState(() => showLoginPage = !showLoginPage);
  }


  @override
  Widget build(BuildContext context) {
      if (showLoginPage){
        return LoginPage(toggleView: toggleView);
      } else {
        return Register(toggleView: toggleView);
      }

  }
}