import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  DropDownPage({Key key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}
class _DropDownPageState extends State<DropDownPage> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Preference",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'English',
                'Chinese',
                'Malaysian',
                'Japanese',
                'Cantonese'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            /*RaisedButton(
              child: Text("Open Multiselect"),
              onPressed: () => _showMultiSelect(context),
            ),*/
          ],
        ),
      ),
    );
  }
}


class Gender {
  int id;
  String name;
  Gender(this.id, this.name);
  static List<Gender> getGenders(){
    return <Gender>[
      Gender(1, "Male"),
      Gender(2, "Female")
    ];
  }
}
class Talkative{
  int id;
  String name;
  Talkative(this.id, this.name);
  static List<Talkative> getTalks(){
    return <Talkative>[
      Talkative(1,"Not Talkative"),
      Talkative(2, "Medium Talkative"),
      Talkative(2, "Very Talkative"),
    ];
  }
}

