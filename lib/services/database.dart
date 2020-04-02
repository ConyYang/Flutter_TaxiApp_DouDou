import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:singtaxi/models/profile.dart';
import 'package:provider/provider.dart';
class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userProfile= Firestore.instance.collection('profile');
  final Firestore _db = Firestore.instance;



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

//get stream


 Future<Profile> getProfile(String uid) async{

    var snap = await _db.collection('name').document(uid).get();

    return Profile.fromMap(snap.data);

 }

 Stream<Profile>  streamProfile(String uid){
    return _db

        .collection('name')
        .document(uid)
        .snapshots()
        .map((snap) => Profile.fromMap(snap.data));



 }




}








