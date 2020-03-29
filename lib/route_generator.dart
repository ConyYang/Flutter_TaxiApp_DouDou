import 'package:flutter/material.dart';
import 'package:singtaxi/main.dart';
import 'package:singtaxi/screens/wrapper.dart';
import 'StartPage.dart';
import 'package:singtaxi/screens/authenticate/LoginPage.dart';
import 'package:singtaxi/screens/home/WelcomePage.dart';
import 'ProfilePage.dart';
import 'DropDownPage.dart';
import 'book/booking.dart';
import 'book/confirmBook.dart';
import 'book/DouDouEat.dart';
import 'book/FreeRides.dart';
import 'AboutUs.dart';
import 'Payment.dart';
import 'book/selectdest.dart';
import 'Settings.dart';
import 'package:singtaxi/screens/authenticate/forgetpassword.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
  final args = settings.arguments;
  switch(settings.name)
  {
    case '/': //home route
      return MaterialPageRoute(builder: (_) => StartPage());
    case '/Wrapper':
          return MaterialPageRoute(builder: (_) => Wrapper());
    case '/Login':
          return MaterialPageRoute(builder: (_) => LoginPage());
    case '/Welcome':
      return MaterialPageRoute(builder: (_) => WelcomePage());
    case '/profile':
      return MaterialPageRoute(builder: (_) => ProfilePage());
    case '/DropDown':
      return MaterialPageRoute(builder: (_) => DropDownPage());
    case '/Book':
      return MaterialPageRoute(builder: (_) => booking());
    case '/confirmBook':
      return MaterialPageRoute(builder: (_) => confirmbook());
    case '/AboutUs':
      return MaterialPageRoute(builder: (_) => AboutUs());
    case '/Payment':
      return MaterialPageRoute(builder: (_) => Payment());
    case '/Setting':
      return MaterialPageRoute(builder: (_) => Settings());
    case '/FreeRides':
      return MaterialPageRoute(builder: (_) => FreeRides());
    case '/SelectDest':
      return MaterialPageRoute(builder: (_) => selectDest());
    case '/Home':
      return MaterialPageRoute(builder: (_) => booking());
   /* case '/Food':
      return MaterialPageRoute(builder: (_) => DouDouEat());*/
    case '/Forget':
      return MaterialPageRoute(builder: (_) => forgetpassword());
    default:
      return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          )
      );
    });
  }

}