import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage(imageUrl, {super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  String get imageUrl => '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Image.network(imageUrl!='' ?imageUrl:"https://miro.medium.com/v2/resize:fit:640/format:webp/0*fYN17M9OYRfDATdd.gif")
    );
  }
}

