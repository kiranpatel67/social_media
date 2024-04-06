import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/data/models/user.dart';
import 'package:social_media/data/network/firebaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/app.screens/home_page/home_screen.dart';


class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ImagePicker picker = ImagePicker();

  String profileImageUpload = '';
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userDescription = TextEditingController();
  bool isUsernameAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Set up your Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF)
          ),),
        leading: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF1932D5),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [Column(
            children: [
              Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0,20,0,0),
                    child: Text(
                      'Upload Profile Picture',
                      style: TextStyle(
                        fontSize: 22,
                      ),),
                  )),
              GestureDetector(
                  onTap: (){
                    profilePicUpload();

                  },
                  child:
                  Container(
                      child:
                      ProfilePicture(
                        name: fullName.text,
                        radius: 64,
                        fontsize: 22,
                        img: profileImageUpload==''?'https://rukminim2.flixcart.com/image/416/416/l12h1u80/poster/g/p/1/small-boss-baby-multicolour-photo-paper-print-poster-original-imagcqfunvdtrgqd.jpeg':profileImageUpload,
                      )



                  )
              ),

              Column(
                children: [

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(right: 32, left: 32),
                    child: TextField(

                      controller: userName,

                      decoration: InputDecoration(
                          label: Text('Username'),
                          hintText: 'Choose your Username',
                          suffixIcon:
                          userName.text==''
                              ?Icon(Icons.change_circle_sharp)
                              :userNameAvailabilityCheck(),

                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1932D5)
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1932D5),
                                  width: 3
                              )
                          )

                      ),


                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(right: 32, left: 32),
                    child: TextField(

                      controller: fullName,

                      decoration: InputDecoration(
                          label: Text('Full Name'),
                          hintText: 'Enter your Full Name',
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1932D5)
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1932D5),
                                  width: 3
                              )
                          )

                      ),


                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(right: 32, left: 32),
                    child: TextField(

                      controller: userDescription,

                      maxLines: 5,
                      decoration: InputDecoration(

                          labelText: 'Write your Awesome Bio here',

                          hintText: 'We would love to know more about you! ',
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1932D5)
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1932D5),
                                  width: 3
                              )
                          )

                      ),


                    ),
                  ),

                  Container(

                    margin: EdgeInsets.only(top:20, bottom: 24),
                    child: ElevatedButton(onPressed: (){
                      saveProfile();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },

                        child: Text('Save Profile', style: TextStyle(
                            color: Color(0xFFFFFFFF)
                        ),),

                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xFF1932D5))
                        )
                    ),
                  )


                ]

                ,
              )
            ],
          )],
        ),
      ),

    );
  }

  Future<String?> profilePicUpload() async{
    XFile? profileImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profileImageUpload = profileImage!.path;
    });
    return profileImageUpload;



  }

  saveProfile(){
    UserDataModel userData = UserDataModel(
        id: _firebaseAuth.currentUser!.uid,
        name: fullName.text,
        profilePic: profileImageUpload,
        username: userName.text,
        userbio: userDescription.text
    );
    FirebaseService.saveUserData(data: userData);

  }

  userNameAvailabilityCheck(){
    setState(() {

    });

    if (isUsernameAvailable){

      return Icon(Icons.check_circle_outline);
    }
    else{

      return Icon(Icons.cancel_outlined);

    }

  }
}