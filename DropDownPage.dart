import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  DropDownPage({Key key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}
class _DropDownPageState extends State<DropDownPage> {
  String dropdownValue_1 = 'English                    ';
  String dropdownValue_2 = 'Male                       ';
  String dropdownValue_3 = 'Not Talkative    ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.brown[600],
      ),
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("android/assets/UserPreference.jpg"),
            fit: BoxFit.cover,
          ),
        ),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue_1,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 30,
                  elevation: 30,
                  style: TextStyle(color: Colors.grey[900]),
                  underline: Container(
                    height: 2,
                    color: Colors.grey[700],
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue_1 = newValue;
                    });
                  },
                  items: <String>[
                    'English                    ',
                    'Chinese          ',
                    'Malaysian        ',
                    'Japanese         ',
                    'Cantonese        '
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue_2,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 30,
                  elevation: 30,
                  style: TextStyle(color: Color(0xFF01579B)),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue_2 = newValue;
                    });
                  },
                  items: <String>[
                'Male                       ',
                    'Female           '
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue_3,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 30,
                  elevation: 30,
                  style: TextStyle(color: Color(0xFF01579B)),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue_3 = newValue;
                    });
                  },
                  items: <String>[
                    'Not Talkative    ',
                    'Medium Talkative ',
                    'Very Talkative   '
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ])
      ),
    );
  }
}

