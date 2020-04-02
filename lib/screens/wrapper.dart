import 'package:flutter/material.dart';
import 'package:singtaxi/screens/authenticate/LoginPage.dart';
import 'package:singtaxi/StartPage.dart';
import 'package:singtaxi/screens/home/WelcomePage.dart';
import 'package:singtaxi/screens/authenticate/authenticate.dart';

import 'package:provider/provider.dart';
import 'package:singtaxi/models/user.dart';
import 'home/onboarding_screen.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of <User>(context);
    print (user);
    //return either home or authenticate widget
    if (user == null) {
      return OnboardingScreen();
    } else {

      return WelcomePage();
    }
  }
}
