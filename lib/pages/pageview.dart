import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class Scrollimage extends StatefulWidget {
  const Scrollimage({super.key});

  @override
  State<Scrollimage> createState() => _ScrollimageState();
}

class _ScrollimageState extends State<Scrollimage> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
    controller: pageController,
    thickness: 10,
    showTrackOnHover: true,
    radius: Radius.circular(0),
    child:Container(
      color: Colors.blue,
      margin: EdgeInsets.fromLTRB(10,10,10,30),
      child: PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: const <Widget>[
        Center(
          child: LikeButton(
            size: 50,
            mainAxisAlignment: MainAxisAlignment.end ,
          ),
        ),
        Center(
          child: LikeButton(
            size: 50,
            mainAxisAlignment: MainAxisAlignment.end ,
          likeCount: 100,
            countPostion: CountPostion.bottom,
          ),
        ),
        Center(
          child: LikeButton(
            size: 50,
            mainAxisAlignment: MainAxisAlignment.end ,),
        ),
      ],
    ),),
  );
  }
}
