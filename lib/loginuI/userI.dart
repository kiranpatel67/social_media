import 'package:flutter/material.dart';
class social_media extends StatefulWidget {
  const social_media({super.key});

  @override
  State<social_media> createState() => _social_mediaState();
}

class _social_mediaState extends State<social_media> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment(0, 1),
        colors: <Color>[
          Color(0xc75505f5),
          Color(0xff340494),

        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios),
          title: Container(
            alignment: Alignment.centerRight,
            child: Text("Don't have an Account?", textAlign: TextAlign.end, style: TextStyle(
              color: Colors.white,fontSize: 16,
            )),
          ),
         actions: [

           Container(
             margin: EdgeInsets.fromLTRB(0,0,32,0),
             child: TextButton(onPressed: (){}
                 , child: Text("Get Started", style: TextStyle(color: Color(0xFFFFFFFF),

               )),
             style: ButtonStyle(
                 backgroundColor: MaterialStatePropertyAll(Color(0x4DFFFFFF)),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
               RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular((6.0),

                 )
               )
             ),
             ),),
           )
         ],
        ),
        body:
          Column(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height*0.20,
                child: Container(
                  margin: EdgeInsets.all(34),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Jobsly",style: TextStyle(
                      fontSize: 30,
                      fontWeight:FontWeight.w600,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
              ),

          Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                   height: MediaQuery.of(context).size.height * 0.8 -56,

                  child:Container(
                    margin: EdgeInsets.fromLTRB(0, 48, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    ),
                    child:Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                          child: Text("Welcome Back" ,style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,

                            fontSize: 24,
                          ),),
                        ),Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                          child: Text("Enter your details below" ,style: TextStyle(
                            color: Color(0xFF363636),
                            // fontWeight: FontWeight.bold,

                            fontSize: 12,
                          ),),
                        ),
                      //   Textfeild starts here______________

                        TextField(

                          decoration: InputDecoration(

                            labelText: "Hello",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Color(0xFFFFFFF))
                            )
                          ),
                        )


                      ],
                    ),


                  )

              ),
              SizedBox( // background wala container
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.8 -56,

                  child:Container(

                    margin: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Color(0x67FFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),


                  )

              ),
            ],
          ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),


          ],
          )

      ),
    );

  }
}


