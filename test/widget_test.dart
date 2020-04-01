import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

void main() => runApp(MyApp());

const List<Key> keys = [
  Key('Network'),
  Key('Network Dialog'),
  Key('Flare'),
  Key('Flare Dialog'),
  Key('Asset'),
  Key('Asset dialog'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Nunito'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text('Giffy Dailog Example'),
          ),
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String networkimg =
        'https://cdn.dribbble.com/users/750517/screenshots/8574989/media/7610aa397363fdfe6f2daa1145493aee.gif';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            key: keys[0],
            child: Text('Network Giffy'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => NetworkGiffyDialog(
                    key: keys[1],
                    image: Image.network(
                      networkimg,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "Ostrich Running",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    description: Text(
                      'This is the Ostrich Running Dialog Box. This will help you to understand NEtwork Giffy Animation',
                      textAlign: TextAlign.center,
                    ),
                    entryAnimation: EntryAnimation.RIGHT,
                    onOkButtonPressed: (){},
                  ));
            },
          ),
          RaisedButton(
            key: keys[2],
            child: Text('Flare Giffy'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => FlareGiffyDialog(
                    key: keys[3],
                    flarePath: 'assets/space_demo.flr',
                    flareAnimation: 'loading',
                    title: Text(
                      "Planet Reloading",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    description: Text(
                      'This is the PLanet Reloading Dialog Box. This will help you to understand Flare Giffy Animation',
                      textAlign: TextAlign.center,
                    ),
                    entryAnimation: EntryAnimation.TOP_LEFT,
                    onOkButtonPressed: (){},
                  ));
            },
          ),
          RaisedButton(
            key: keys[4],
            child: Text('Asset Giffy'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AssetGiffyDialog(
                    key: keys[5],
                    image: Image.asset('assets/rappi_basket.gif'),
                    title: Text(
                      "Rappi Basket",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    description: Text(
                      'This is theRappi Basket Dialog Box. This will help you to understand Asset Giffy Animation',
                      textAlign: TextAlign.center,
                    ),
                    entryAnimation: EntryAnimation.TOP_LEFT,
                    onOkButtonPressed: (){},
                  ));
            },
          ),
        ],
      ),
    );
  }
}