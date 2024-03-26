import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/pages/image_page.dart';

class ImgUpload extends StatefulWidget {
  const ImgUpload({super.key});

  @override
  State<ImgUpload> createState() => _ImgUploadState();
}

class _ImgUploadState extends State<ImgUpload> {
  final pageController = PageController(initialPage: 1);

  get imageUrl => '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        reverse: true,
        scrollDirection: Axis.horizontal,

        children: [
          GetImage(imageUrl),
          ImagePage(imageUrl),


        ],

      ),
    );
  }
}
class GetImage extends StatefulWidget {
  const GetImage(imageUrl, {super.key});

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  final TextEditingController imageUrl = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextField(controller: imageUrl,
              decoration: InputDecoration(
                hintText: "Enter the Image URL",
              ),
            ),
          ),
          TextButton(onPressed: (){
            GetImage(imageUrl);
          }, child: Text("Submit"))
        ],
      )

    );
  }
}
