import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../data/models/photos.dart';
import '../data/network/firebaseService.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> photos = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index)
          {

        return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                Image.network(
                    '${PhotosDataModel.fromJson(photos[index].data()).imageurl[0]}'
                ),
                LikeButton(
                    countPostion: CountPostion.right
                )
              ],
            )

        );
      }),
    );
  }

  void getdata() async{
    QuerySnapshot<Map<String, dynamic>> photoData = await FirebaseService.getPhotosData();
    setState(() {
      photos = photoData.docs;
    });
  }
}
