import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {

    final userdata = Provider.of<List<profile>>(context);
    //print(userdata.documents);
    for (var doc in userdata.documents ){
      print (doc.data);
    }


    return Container();
  }
}
