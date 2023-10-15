import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
class showstory extends StatefulWidget {
  final int index;
  final List<dynamic> listb;
  final List<String> lnames;
  final String photos;
  final String? name;
  showstory({super.key, required this.listb, required this.index, required this.photos, required this.name, required this.lnames, });
  @override
  State<showstory> createState() => _showstoryState();

}
class _showstoryState extends State<showstory> {
  List<String> pics =[
    "assets/images/profile.png",
    "assets/images/profile2.png",
  ];
  List<String> lname =[
    "Délégué l2",
    "Délégué l3"
  ];
  final stroyController = StoryController();
  @override
  Widget build(BuildContext context) {
    int j=0;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StoryView(
                storyItems: [
                  for(int i=widget.index-widget.index;i<widget.listb.length;i++,)
                  StoryItem.text(
                      title:widget.listb[i], backgroundColor: Color((math.Random().nextDouble()*0xFFFFFF).toInt()).withOpacity(1.0),textStyle: TextStyle(fontSize: 30,
                   fontWeight: FontWeight.bold,
                  ),
                  ),

                ],onStoryShow: (s){

            },
              onVerticalSwipeComplete: (direction){
                  if(direction == Direction.down){
                    Navigator.pop(context);
                  }
              },
              onComplete: (){
                  Navigator.pop(context);
            },progressPosition: ProgressPosition.top,
                repeat: false,
                inline: false,
                controller: stroyController,

            ),

            Align(alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for(int i=widget.index;i<widget.index+1;i++)
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(widget.photos,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.name!,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Text("Aujourd'hui",style: TextStyle(color: Colors.grey[100]),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

