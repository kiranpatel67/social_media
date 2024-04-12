import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
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


  static Future<QuerySnapshot<Map<String, dynamic>>> getPhotosData(){
    return firestore.collection('photos').where('uid', isEqualTo: getUserId() ).get();
  }
  
  static saveUserData({required UserDataModel data}){
    firestore.collection('users').doc(getUserId()).set(data.getMap(), SetOptions(merge: true))
    .onError((error, stackTrace) => print(error));
    
  }
  static savePhotos({required PhotosDataModel data}){
    firestore.collection('photos').doc(data.id).set(data.getPhotoMap(), SetOptions(merge: true))
        .onError((error, stackTrace) => print(error));

  }
  static Future<String> uploadPhotos({required XFile file}) async{

    Reference spaceRef = storageRef.child("${_firebaseAuth.currentUser?.uid}/${DateTime.timestamp().millisecondsSinceEpoch.toString()}${p.extension(file.name)}" );
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
    );

    if(kIsWeb){

      await spaceRef.putData(await file.readAsBytes(), metadata).whenComplete(() => print('Done'));
    }else{
      await spaceRef.putFile(File(file.path), metadata).whenComplete(() => print('Done'));
    }
    return await spaceRef.getDownloadURL();
  }
  // likedPhoto({required PhotosDataModel data}){
  //   if(isLiked){
  //     firestore.collection('user').doc(getUserId()).set(data.getPhotoMap('likedby'));
  //   }
  //
  // }
}
