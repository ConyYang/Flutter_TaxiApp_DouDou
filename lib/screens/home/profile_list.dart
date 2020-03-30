import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:singtaxi/models/profile.dart';
import 'package:singtaxi/screens/home/profile_tile.dart';

class Profilelist extends StatefulWidget {
  @override
  _ProfilelistState createState() => _ProfilelistState();
}

class _ProfilelistState extends State<Profilelist> {
  @override
  Widget build(BuildContext context) {

    final profile = Provider.of<List<Profile>>(context);

    return ListView.builder(
      itemCount: profile.length,
      itemBuilder: (context, index){
      return  ProfileTile(profile: profile[index]);

      },

    );
    //profile.forEach((Profile){

      //print(Profile.name);
    //  print(Profile.email);

    //return Container();
  }
}
