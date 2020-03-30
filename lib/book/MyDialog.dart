import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  var _date = DateFormat("EEEE, MMM d").format(new DateTime.now());
  var _time =
  TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  var timet = DateFormat("jm").format(new DateTime.now());

  /*

       context: context,
                                          builder: (BuildContext context) {

                                          });

   */
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: AlertDialog(
          content: Form(
            child: Container(
                height: 250,
                width: 400,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Text(
                          "Schedule a Ride",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 28.0, color: Colors.orangeAccent[700]),
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: new GestureDetector(
                          child: Text(
                            "$_date",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 24.0, color: Colors.black),
                          ),
                          onTap: () async {
//
                            final DateTime pick = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2017),
                                lastDate: DateTime(2021));
                            if (pick != null && pick != _date) {
                              setState(() {
                                _date = DateFormat("EEEE, MMM d").format(pick);
                                //'${pick.weekday}, ${pick.month} ${pick.day}';
                              });
                              print("Date is " + _date);
                            }
                          },
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: new GestureDetector(
                          child: Text(
                            "$timet",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 24.0, color: Colors.black),
                          ),
                          onTap: () async {
                            final TimeOfDay pick = (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ));
                            setState(() {
                              var _timetmp = TimeOfDay(
                                  hour: pick.hour, minute: pick.minute);
                              final now = DateTime.now();
                              final selectedTime = new DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  _timetmp.hour,
                                  _timetmp.minute);
                              timet = DateFormat("jm").format(selectedTime);
                              //'${pick.weekday}, ${pick.month} ${pick.day}';
                            });
                            print("Date is " + _date);
                          },
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: new Container(
                          height: 1.0,
                          color: Color.fromRGBO(239, 239, 239, 1.0),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        color: Colors.brown[600],
                        width: 350,
                        height: 50,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        child: new RaisedButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Ride is scheduled");
                            Navigator.pop(context);
                          },
                          textColor: Colors.white,
                          color: Colors.brown[600],
                          child: new Text(
                            "SET PICKUP TIME",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                        ))
                  ],
                )),
          ),
        ));
  }
}