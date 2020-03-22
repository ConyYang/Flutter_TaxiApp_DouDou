import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userProfile= Firestore.instance.collection('profile');


  Future updateUserData(bool driver,String name, String talkative, int number, double rating, bool gender, String email, String license, String carplate, String payment) async
  {
    return await userProfile.document(uid).setData({
      'name': name,
      'driver': driver,
      'talkative': talkative,
      'number': number,
      'rating': rating,
      'gender': gender,
      'email': email,
      'license': license,
      'carplate': carplate,
      'payment': payment,

    });
  }


  }



