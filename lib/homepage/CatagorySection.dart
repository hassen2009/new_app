import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/homepage/ctg/lone.dart';
import 'package:new_app/homepage/links.dart';

import 'package:new_app/homepage/models/centraleslist.dart';
import 'package:new_app/homepage/palette.dart';

import 'ctg/ltwo.dart';


class  CatagorySection extends StatelessWidget {
  const CatagorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 700,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20) ,
          topRight: Radius.circular(20) ,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
             // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text("Spécialité",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
                height: 120,
              // color: Colors.yellow,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap:(){
                            Get.to( ()=> Eea());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 8)),
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          Colors.blueAccent,
                                          Colors.deepPurple
                                        ])
                                ),
                                child: Center(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.electric_bolt_rounded,size: 25,color: Colors.white,),
                                        Text("EEA L2",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.white
                                        ),textAlign: TextAlign.center,)
                                      ],
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap:(){
                            Get.to( ()=> Ea());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 8)),
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                      Colors.green,
                                      Colors.greenAccent
                                    ])

                                ),
                                child: Center(
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.electric_bolt_rounded,size: 25,color: Colors.white,),
                                          Text("EEA L3",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white
                                          ),textAlign: TextAlign.center,)
                                        ],
                                      )
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),


                    ]
                )
            ),
            Container(height: 4,color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
              child: GestureDetector(
                onTap: (){
                  Get.to(()=>const pagelinks());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 120,
                      height: 120,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.deepOrange,
                        Colors.orange
                      ]),
                    ),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school,color: Colors.white,),
                        SizedBox(height: 2,),
                        Text("Faculte des sciences et des techniques",style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),textAlign: TextAlign.center,)
                      ],
                    ),),
                  ),
                ),
              ),
            ),
            Container(height: 4,color: Get.isDarkMode?Colors.grey[900]:Colors.grey[300],),
            Container(
              //color: Colors.red,
              padding: EdgeInsets.all(20),
              child: Text("E.E.A",style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                fontFamily: "Poppins-Bold"
              ),),
            ),
            Ctrle(),
          ]
      ),
    );
  }
}


