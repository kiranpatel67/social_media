import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media/app.screens/LoginSignup/setUserProfile.dart';
import 'package:social_media/app.screens/home_page/home_screen.dart';
import 'package:social_media/app.screens/LoginSignup/UserLogin.dart';

import 'data/network/firebaseService.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  FirebaseOptions(apiKey: "AIzaSyAL_P9kzNP1KK-IpadVCFrkV2IZKDInoDw",
      appId: "1:606670063011:android:854e53ce0d4988fef0c616",
      messagingSenderId: "606670063011",
      projectId: "social-media-ani-kiran",
      storageBucket: 'social-media-ani-kiran.appspot.com'));
  DocumentSnapshot<Map<String, dynamic>> data = await FirebaseService.getUserData();
  runApp( MyApp(userData:data.data()));
}

class MyApp extends StatelessWidget {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Map<String, dynamic>? userData;
   MyApp({super.key,  this.userData});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: _firebaseAuth.currentUser != null ? getScreen(context) : HomeScreen(),

    );
  }

  Widget getScreen(BuildContext context) {

    if(userData != null){
     return HomeScreen();
    }
    else{
      return SetProfileScreen();
    }
  }
}

