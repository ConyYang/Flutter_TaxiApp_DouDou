
import 'package:flutter/material.dart';


class AlertPage extends StatefulWidget{
  AlertPage ({Key key, this.title}) :super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => AlertPageState();
}
class  AlertPageState  extends State<AlertPage> {
@override
TextEditingController customController = new TextEditingController();
Widget build(BuildContext cx) {
  return TextField(
    controller:customController,
  );
}
username(BuildContext context)
{
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your Name?"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('Submit'),
          onPressed:(){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  });
}

Contact(BuildContext context)
{
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your Phone?"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('Submit'),
          onPressed:(){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  });
}

Email(BuildContext context)
{
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your Email?"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('Submit'),
          onPressed:(){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  });
}

Location(BuildContext context)
{
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your Location?"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('Submit'),
          onPressed:(){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  });
}

Nation(BuildContext context)
{
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your Nationality?"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('Submit'),
          onPressed:(){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  });
}

}