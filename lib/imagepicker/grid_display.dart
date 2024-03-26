
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class GridDisplay extends StatefulWidget {
  const GridDisplay({super.key});

  @override
  State<GridDisplay> createState() => _GridDisplayState();
}

class _GridDisplayState extends State<GridDisplay> {
  XFile? selectedImage;
  String text = "Pick Image";
  File? pickedImage;
  bool isPicked = false;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: Text(
                      selectedImage == null ? "Pick Image": "Submit",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () async{
                    selectedImage = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {

                    });
                  }
              ),

            ],
          ),
        )

    );
  }
}

