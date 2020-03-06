import 'package:flutter/material.dart';

class createAlertDialog extends StatelessWidget {
@override
TextEditingController customController = new TextEditingController();

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
            Navigator.of(context).pushNamed('/profile');
          },
        )
      ],
    );
  });
}

Widget build(BuildContext cx) {}
}