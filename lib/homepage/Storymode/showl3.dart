import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
class showl3 extends StatefulWidget {
  final int index;
  final List<dynamic> listl3;
  const showl3({super.key, required this.index, required this.listl3});
  @override
  State<showl3> createState() => _showl3State();
}

class _showl3State extends State<showl3> {
  final stroyController2 = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StoryView(
                storyItems: [
                  for(int i=widget.index;i<widget.listl3.length;i++)
                    StoryItem.text(
                      title:widget.listl3[i], backgroundColor: Colors.green,textStyle: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),


                ],onStoryShow: (s){

            },onComplete: (){

            },progressPosition: ProgressPosition.top,
                repeat: false,
                inline: false,
                controller: stroyController2
            ),
            Align(alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){Get.back();},icon: Icon(Icons.cancel,color: Colors.grey[300],size: 30,),),
              ),
            ),
            Align(alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Délégué",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                          Text("17:11",style: TextStyle(color: Colors.white))
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
