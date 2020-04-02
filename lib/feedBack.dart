import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class feedBack extends StatefulWidget {
  feedBack({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _feedBackState createState() => _feedBackState();
}

class _feedBackState extends State<feedBack> {
  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 7,
    remindDays: 2,
    remindLaunches: 5,
    // appStoreIdentifier: '',
    // googlePlayIdentifier: '',
  );

  @override
  void initState() {
    super.initState();
    _rateMyApp.init().then((_) {
      // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
      // if (_rateMyApp.shouldOpenDialog) {
      _rateMyApp.showStarRateDialog(
        context,
        title: 'Enjoying Flutter Rating Prompt?',
        message: 'Please leave a rating!',
        onRatingChanged: (stars) {
          return [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                if (stars != null) {
                  _rateMyApp.doNotOpenAgain = true;
                  _rateMyApp.save().then((v) => Navigator.pop(context));

                  if (stars <= 3) {
                    print('Navigate to Contact Us Screen');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => ContactUsScreen(),
                    //   ),
                    // );
                  } else if (stars <= 5) {
                    print('Leave a Review Dialog');
                    // showDialog(...);
                  }
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ];
        },
        dialogStyle: DialogStyle(
          titleAlign: TextAlign.center,
          messageAlign: TextAlign.center,
          messagePadding: EdgeInsets.only(bottom: 20.0),
        ),
        starRatingOptions: StarRatingOptions(),
      );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}