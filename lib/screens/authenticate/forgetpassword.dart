import 'package:flutter/material.dart';
import 'package:singtaxi/services/auth.dart';
import 'package:singtaxi/Shared/Loading.dart';


class forgetpassword extends StatefulWidget {
  @override
  _forgetpasswordState createState() => _forgetpasswordState();
}


bool loading = false;
String email = '';
String error ='';


class _forgetpasswordState extends State<forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
        appBar: AppBar(
          title: Text('DouDou'),
          backgroundColor: Colors.brown[600],
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
                    child: Text('Hello',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold,
                          color: Colors.amber[900]),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 100.0, 0.0, 0.0),
                    child: Text('DouDou',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold,
                            color: Colors.amber[900])),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(300.0, 100.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.limeAccent[700])),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child:Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration: InputDecoration(
                            labelText: 'Enter your email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),

                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(

                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.lime[900],
                          color: Colors.lime[800],
                          elevation: 7.0,
                          child: RaisedButton(
                              child: Center(
                                child: Text(
                                  'Retrieve my password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              onPressed: () async {
                                  setState(()=> loading = true);

                                  dynamic result = await AuthService().resetPassword(email);

                                  if(result == null)
                                  {
                                    setState(() =>
                                    error = 'Email failed to send. Try again.');
                                    loading = false;
                                  }
                                  else
                                    {
                                      setState(() =>
                                      error = 'Email Sent successfully, please check your Email');
                                      loading = false;
                                    }


                              }
                          ),
                        ),

                      ),
                      SizedBox(height: 12.00),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),),


                    ],

                  )     ),
            ),

          ],
        ));
  }





  }




