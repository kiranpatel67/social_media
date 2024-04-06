import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/data/models/user.dart';

import '../models/photos.dart';


class FirebaseService {
  int likeCount = 0;
  bool isLiked = false;
  final Reference storageRef = FirebaseStorage.instance.ref();
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
  uploadPhotos({required data}){
       firestore.collection('user').doc(getUserId()).set(data.getPhotoMap())  .onError((error, stackTrace) => print(error));
  }
  // likedPhoto({required PhotosDataModel data}){
  //   if(isLiked){
  //     firestore.collection('user').doc(getUserId()).set(data.getPhotoMap('likedby'));
  //   }
  //
  // }
}
