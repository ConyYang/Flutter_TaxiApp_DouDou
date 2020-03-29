import 'package:flutter/material.dart';
import 'package:singtaxi/Shared/Loading.dart';
import 'package:singtaxi/services/auth.dart';
import 'package:singtaxi/screens/authenticate/forgetpassword.dart';

class LoginPage extends StatefulWidget {

     final Function toggleView;
     LoginPage({this.toggleView});


  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

//text field state

  String email = '';
  String password = '';
  String error ='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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

               key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                    validator:(val) => val.isEmpty ? 'Enter an Email' : null,
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
                    validator:(val) => val.length < 6 ? 'Enter a passowrd with 6 or more characters' : null,
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
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Forget');
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.orangeAccent[400],
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),

                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(

                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.lime[900],
                        color: Colors.blue[800],
                        elevation: 7.0,
                        child: RaisedButton(
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()){

                                setState(()=> loading = true);

                                dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                                if(result == null)
                                {
                                  setState(() =>
                                  error = 'Sign in Failed, Please try again');
                                  loading = false;
                                }
                              }
                            }
                        ),
                      ),
                    ),
                    SizedBox(height : 12.00),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: ImageIcon(AssetImage('android/assets/google-icon.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Log in with Google',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to DouDou ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                   // Navigator.of(context).pushNamed('/');
                      widget.toggleView();
                  },
                  child: Text(
                    'Register',
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