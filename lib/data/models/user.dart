// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


class UserDataModel {
  String id;
  String name;
  String profilePic;

  UserDataModel({
    required this.id,
    required this.name,
    required this.profilePic,
  });
  getMap(){
    return {
      'id':id,
      'name':name,
      'profilePic':profilePic
    };
  }

}
