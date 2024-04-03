import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Scroll extends StatefulWidget {
  const Scroll({super.key});

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
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
            leading: Icon(Icons.arrow_back_ios, color: Color(0xFFFFFFFF),),
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
                    ),),),
              )
            ],
          ),
          body: ListView(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height*0.20,
                child: Container(
                  margin: EdgeInsets.all(34),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Social Media",style: TextStyle(
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

                  Container(

                    margin: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF).withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),


                  ),
                  Container(
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

                        Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(

                              margin: EdgeInsets.fromLTRB(20, 28, 20, 0),
                              child: TextField(
                                controller: text1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Text2",
                                  hintText: "Enter the text2",
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 28, 20, 0),
                              child: TextField(
                                controller: text2,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Text2",
                                  hintText: "Enter the text2",
                                ),
                              ),
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 80,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 28, 20, 0),
                                decoration: BoxDecoration(gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: <Color>[
                                    Color(0xff340494),
                                    Color(0xff340494),
                                    Color(0xff940440),
                                  ],
                                )),
                                // margin: EdgeInsets.fromLTRB(20, 28, 20, 0),
                                child: TextButton(onPressed:() {

                                 },
                                  child: Text("Click Here", style: TextStyle(color: Color(0xFFFFFFFF),
                                  )),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular((6.0),

                                            )
                                        )
                                    ),),),
                              ),
                            ),

                         ],
                        )


                      ],
                    ),


                  ),

                ],
              ),

            ],
          )

      ),
    );
  }
}
