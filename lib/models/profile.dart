import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {

  final bool driver;
  final String name;
  final String talkative;
  final int number;
  final double rating;
  final bool gender;
  final String email;
  final String license;
  final String carplate;
  final String payment;
  final String language;

  Profile({ this.driver, this.name,this.talkative,this.number,this.rating, this.gender, this. email, this. license, this.carplate, this.payment, this.language});

  factory Profile.fromFirestore(DocumentSnapshot doc){

    Map data = doc.data;

    return Profile(
      driver: data['driver'] ?? '',
        name: data['name'] ?? '',
        talkative: data['talkative'] ?? '',
        number: data['number'] ?? '',
        rating: data['rating'] ?? '',
        gender: data['gender'] ?? '',
        email: data['email'] ?? '',
        license: data['license'] ?? '',
        carplate: data['carplate'] ?? '',
        payment: data['payment'] ?? '',
        language: data['language'] ?? '',


    );


  }


}