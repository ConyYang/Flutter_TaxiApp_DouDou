import 'package:flutter/material.dart';
import 'package:singtaxi/main.dart';
import 'package:singtaxi/screens/wrapper.dart';
import 'StartPage.dart';
import 'package:singtaxi/screens/authenticate/LoginPage.dart';
import 'package:singtaxi/screens/home/WelcomePage.dart';
import 'ProfilePage.dart';
import 'DropDownPage.dart';
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