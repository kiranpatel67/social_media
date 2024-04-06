import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
class Storybar extends StatefulWidget {
  const Storybar({super.key});

  @override
  State<Storybar> createState() => _StorybarState();
}

class _StorybarState extends State<Storybar> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: SizedBox(

          width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          alignment: Alignment.centerLeft,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
          ),


          child:
          Container(
            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  width: 2,
                    gradient: LinearGradient(
                    colors: [
                      Color(0xFF4FFFFF),
                      Color(0xFFFF3FFF)])),
                borderRadius: BorderRadius.circular(64)
            ),

            child: ProfilePicture(

                name: '',
                radius: 24,
                fontsize: 42,
                img : 'https://cdn4.sharechat.com/sc_compressed_gm_40_hzt7jMzgxODExMTU2NQ.jpg'
            ),
          )
          ),
            ),
      );
  }
}
