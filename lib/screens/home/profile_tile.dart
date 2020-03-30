import 'package:flutter/material.dart';
import 'package:singtaxi/models/profile.dart';

class ProfileTile extends StatelessWidget {

  final Profile profile;
  ProfileTile({this.profile});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child:Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius:25.0,
            //backgroundColor: Colors.brown[Profile.name],
          ),
              title: Text(profile.name),
              subtitle: Text('lol')
        ),
      ),

    );
  }
}
