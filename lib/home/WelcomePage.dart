import 'package:flutter/material.dart';
import 'package:singtaxi/services/auth.dart';
class WelcomePage extends StatefulWidget {
  WelcomePage ({Key key, this.title}) :super(key: key);
  final String title;
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final AuthService _auth = AuthService();
  //final String title;
  //WelcomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('DouDou'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ]

      ),
      //body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown[600],
              ),
              accountName: Text("Cony Yang"),
              accountEmail: Text("yangyubei0218@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amberAccent[700],
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0,
                    color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.functions),
              title: Text('Booking'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/Book');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/Setting');
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('AboutUs'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/AboutUs');
              },
            )
          ],
        ),
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("android/assets/WelcomePage.jpg"),
            fit: BoxFit.cover,
            //color: Colors.blueGrey,
            //colorBlendMode: BlendMode.darken,
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Form(
                child: new Theme(
                    data: ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.white, fontSize: 10.0))),
                    child: new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          new MaterialButton(
                            height: 20.0,
                            minWidth: 50.0,
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: new Text("LogOut"),
                            onPressed: () async {
                              print("Pressed on a RaisedButton");
                              Navigator.of(context).pushNamed('/'); //route
                            },
                            splashColor: Colors.yellowAccent,
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}