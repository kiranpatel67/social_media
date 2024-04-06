import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/data/models/user.dart';
import 'package:path/path.dart' as p;

import '../models/photos.dart';


class FirebaseService {
  int likeCount = 0;
  bool isLiked = false;
  static Reference storageRef = FirebaseStorage.instance.ref();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async{
    return firestore.collection('users').doc(getUserId()).get();
  }
  static getUserId(){
    return _firebaseAuth.currentUser?.uid;
  }


  Future<QuerySnapshot<Map<String, dynamic>>> getPhotos(){
    return firestore.collection('users').doc(getUserId()).collection('photos').get();
  }
  
  static saveUserData({required UserDataModel data}){
    firestore.collection('users').doc(getUserId()).set(data.getMap(), SetOptions(merge: true))
    .onError((error, stackTrace) => print(error));
    
  }
  savePhotos({required data}){
    firestore.collection('users').doc(getUserId()).collection('photos').doc(data.id).set(data, SetOptions(merge: true))
        .onError((error, stackTrace) => print(error));

  }
  static uploadPhotos({required File file}){
    Reference spaceRef = storageRef.child("${_firebaseAuth.currentUser?.uid}/${DateTime.timestamp().microsecond.toString()}${p.extension(file.path)}" );
   print(file.absolute.path);
    spaceRef.putFile(file).whenComplete(() => print('Done'));
  }
  // likedPhoto({required PhotosDataModel data}){
  //   if(isLiked){
  //     firestore.collection('user').doc(getUserId()).set(data.getPhotoMap('likedby'));
  //   }
  //
  // }
}
