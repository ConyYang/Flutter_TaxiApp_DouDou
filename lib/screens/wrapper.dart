import 'package:flutter/material.dart';
import 'package:singtaxi/screens/authenticate/LoginPage.dart';
import 'package:singtaxi/StartPage.dart';
import 'package:singtaxi/screens/home/WelcomePage.dart';
import 'package:singtaxi/screens/authenticate/authenticate.dart';
import 'package:singtaxi/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:singtaxi/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of <User>(context);
    print (user);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return WelcomePage();
    }
  }
}
