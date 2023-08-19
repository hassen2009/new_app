import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/homepage/ctg/lone.dart';

import 'package:new_app/homepage/models/centraleslist.dart';


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
              padding: EdgeInsets.all(20),
              child: Text("Spécialité",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
                height: 120,
              // color: Colors.yellow,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
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
                              Padding(padding: EdgeInsets.only(top: 15)),
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurpleAccent,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.black.withOpacity(0.7)
                                    )
                                  ]
                                ),
                                child: Center(
                                  child: Center(
                                    child: Icon(Icons.electric_bolt_rounded,size: 25,color: Colors.white,)
                                  ),
                                ),
                              ),
                            Padding(padding: EdgeInsets.only(top: 15)),
                              Text("EEA",style: TextStyle(
                                fontSize: 15,
                              ),),
                            ],
                          ),
                        ),
                      ),


                    ]
                )
            ),
            Container(
              //color: Colors.red,
              padding: EdgeInsets.all(20),
              child: Text("Centrales Électriques",style: TextStyle(
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


