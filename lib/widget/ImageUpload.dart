import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:like_button/like_button.dart';
import 'package:social_media/data/models/photos.dart';
import 'package:social_media/data/network/firebaseService.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {



  List<XFile> selectedImages = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

               body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              child: TextButton(onPressed: () async{
                if(selectedImages.length==0){
                  PickImages();
                }
                else{
                  List<String> imageUrlList = [];
                  await Future.forEach(selectedImages,
                          (image) async{
                   String imageUrl = await FirebaseService.uploadPhotos(file: image);
                   imageUrlList.add(imageUrl);
                   print(imageUrl);
                  });
                  print('hello $imageUrlList');
                  PhotosDataModel photoData = PhotosDataModel(id: DateTime.timestamp().microsecondsSinceEpoch.toString(),
                      uid: FirebaseService.getUserId() ,
                      title: 'Post',
                      description: 'Hello',
                      imageurl: imageUrlList, likedby: [], likecount: 0);
                  FirebaseService.savePhotos(data: photoData);
                }


              },
                  style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((color) => Color(
                      0xFF7076BE))),
                  child: Text(selectedImages.length==0?'Select Images':'submit',
                    style: TextStyle(color: Color(0xFFFFFFFF)),


                  )


              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(

                  color: Color(0xFF8774AF)
              ),
              child: CarouselSlider.builder(itemCount: selectedImages.length!=0?selectedImages.length:1, itemBuilder: (context, index, realIndex) {
                if(selectedImages.length ==0){

                  return Text('No Images Selected', style: TextStyle(color: Color(0xFFFFFFFF)),);
                }
                else{
                  return Image.network(selectedImages[index].path);
                }

              },

                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 200,
                    autoPlay: true,

                  )),
            )

          ],
        )

    );
  }

  Future PickImages() async{

    final List<XFile> pickedImage = await picker.pickMultiImage();
    List<XFile> xfilePick = pickedImage;

    setState(
          () {
            selectedImages = xfilePick;
      },
    );



  }

}
