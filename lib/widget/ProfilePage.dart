import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:social_media/data/network/firebaseService.dart';

import '../app.screens/LoginSignup/setUserProfile.dart';
import '../data/models/photos.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Column(

        children: [

          Stack(

              children: [

                Container(
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://cdn4.sharechat.com/sc_compressed_gm_40_hzt7jMzgxODExMTU2NQ.jpg'),
                  ),
                ),

                Positioned(
                    bottom: 0,
                    left:80,
                    child: IconButton(icon: Icon(Icons.edit, color: Color(0xFFFFFFFF)),onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SetProfileScreen() ));
                    },)

                )
              ]
          ),
          Container(
              child: Text('UserName')
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20,10,20,0),
            height: 60,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [Text('${photos.length}'),
                  Text('Posts'),],),
                Column(children: [Text('0'),
                  Text('Followers'),],),
                Column(children: [Text('0'),
                  Text('Following'),],),

              ],
            ),
          ),



          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
              height: MediaQuery.of(context).size.height * 0.9,
              child: GridView.builder(
            itemCount: photos.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2
                ),

                itemBuilder: (context, index){
                  return Image.network('${PhotosDataModel.fromJson(photos[index].data()).imageurl[0]}');
                },
              ),
            ),
          ),


        ],
      ),
    );
  }

  void getdata() async{
    QuerySnapshot<Map<String, dynamic>> photoData = await FirebaseService.getPhotosData();
    setState(() {
      photos = photoData.docs;
    });
  }

}