import 'package:flutter/material.dart';
import 'package:social_media/app.screens/LoginSignup/setUserProfile.dart';

import 'package:social_media/widget/ImageUpload.dart';
import 'package:social_media/widget/bottom_bar.dart';
import 'package:social_media/widget/Stories.dart';
import 'package:like_button/like_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex =0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.camera_alt_rounded,size: 30,color: Colors.grey.shade600,),
        elevation: 0,

        titleSpacing: 3,
        actions: [

          Storybar(),
       IconButton(onPressed: (){}, icon: Image.network('https://cdn-icons-png.freepik.com/512/5883/5883521.png',width: 30,),),
        ],
      ),
       body: <Widget> [
         Container(
           child:

           Container(
               child: Image.network('https://cdn-icons-png.freepik.com/512/5883/5883521.png')
           ),
         ),
       Container(
         child: ImageUpload(),
       )
       ][currentPageIndex],

     bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
      setState(() {
        currentPageIndex = index;
      });
    },
    indicatorColor: Color(0xFFFF5FFF),
    selectedIndex: currentPageIndex,
    destinations: const <Widget> [
    NavigationDestination(icon: Icon(Icons.home,size: 22,),label: 'Home'),
    NavigationDestination(icon: Icon(Icons.add,size: 22,),label: 'Upload', ),
    NavigationDestination(icon: Icon(Icons.search,size: 22,),label: 'Explore'),
    NavigationDestination(icon: Icon(Icons.person,size: 22,),label: 'Profile'),

    ],


    ),
    );
  }
}
