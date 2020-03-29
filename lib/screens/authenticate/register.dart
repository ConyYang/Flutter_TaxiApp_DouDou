import 'package:flutter/material.dart';
import 'package:singtaxi/services/auth.dart';
import 'package:singtaxi/Shared/Loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;

// text field state
String email = '';
String password = '';
String cpassword='';
String error ='';

class _RegisterState extends State<Register> {
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
                key:_formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.length < 6 ? 'Enter a passowrd with 6 or more characters' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.length < 6 ? 'Please confirm your password' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => cpassword = val);
                      },
                      decoration: InputDecoration(
                          labelText: 'CONFIRM PASSWORD',
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
                                'REGISTER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate() && password==cpassword) {
                                setState(() => loading = true );
                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                                if (result == null) {
                                  setState(() {

                                    if (password==cpassword) {
                                      error = 'Register Failed Try Again';
                                    }
                                    else
                                      {
                                        error = 'Please reconfirm password';
                                      }
                                    loading = false;

                                  });
                                }
                                else{
                                  widget.toggleView();
                                }
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
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                   // Navigator.of(context).pushNamed('/');
                    widget.toggleView();
                  },
                  child: Text(
                    'SignIn',
                    style: TextStyle(
                        color: Colors.orangeAccent[400],
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),

                  ),
                )
              ],
            )
          ],
        ));
  }
}
