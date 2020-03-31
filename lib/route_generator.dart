import 'package:flutter/material.dart';
import 'package:singtaxi/RateRemark/tripRate.dart';
import 'package:singtaxi/yourTrip/YourTrip.dart';
import 'package:singtaxi/main.dart';
import 'package:singtaxi/screens/wrapper.dart';
import 'StartPage.dart';
import 'package:singtaxi/screens/authenticate/LoginPage.dart';
import 'package:singtaxi/screens/home/WelcomePage.dart';
import 'profile/ProfilePage.dart';
import 'profile/DropDownPage.dart';
import 'book/booking.dart';
import 'book/confirmBook.dart';
import 'RateRemark/remark.dart';
import 'FreeRides.dart';
import 'AboutUs.dart';
import 'payment/Payment.dart';
import 'book/selectdest.dart';
import 'Settings.dart';
import 'package:singtaxi/screens/authenticate/forgetpassword.dart';
import 'book/driverMap.dart';
import 'book/selectDriver.dart';
import 'RateRemark/tripRate.dart';

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
      return MaterialPageRoute(builder: (_) => SelectDest());
    case '/driverMap':
      return MaterialPageRoute(builder: (_) => driverMap());
    case '/selectDriver':
      return MaterialPageRoute(builder: (_) => UsingDialog());
    case '/Home':
      return MaterialPageRoute(builder: (_) => booking());
    case '/TripRate':
      return MaterialPageRoute(builder: (_) => TripRatePage());
    case '/Remark':
      return MaterialPageRoute(builder: (_) => RemarkPage());
    case '/Forget':
      return MaterialPageRoute(builder: (_) => forgetpassword());
    case '/YourTrip':
      return MaterialPageRoute(builder: (_) => YourTrip());
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