// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';


class UserDataModel {
  String id;
  String name;
  String profilePic;
  String username;
  String userbio;

  UserDataModel({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.username,
    required this.userbio,
  });
  getMap(){
    return {
      'id':id,
      'name':name,
      'profilePic':profilePic,
      'username':username,
      'userbio':userbio
    };
  }

  factory UserDataModel.fromJson( Map<String, dynamic> data){
    return UserDataModel(id: data['id'],
        name: data['name'],
        profilePic: data['profilePic'],
        username: data['username'],
        userbio: data['userbio']);

  }


}
