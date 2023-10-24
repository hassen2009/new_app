import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class pagelinks extends StatefulWidget {
  const pagelinks({super.key});

  @override
  State<pagelinks> createState() => _pagelinksState();
}

class _pagelinksState extends State<pagelinks> {
  final videoURL = "https://youtu.be/oMlUizEEimc?si=LeAfMb4jIk1lUA4m";
  late YoutubePlayerController _controller;
  final videoURL2 = "https://www.youtube.com/watch?v=7G34cPY1Y-Y&t=139s";
  late YoutubePlayerController _controller2;


  @override
  void initState() {
    // TODO: implement initState
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false),
    );
    final videoID2 = YoutubePlayer.convertUrlToId(videoURL2);
    _controller2 = YoutubePlayerController(
      initialVideoId: videoID2!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset("assets/images/fst.png",scale: 03,)),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YoutubePlayer(controller: _controller,
                  showVideoProgressIndicator: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(

                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.lightBlue,
                                Colors.deepPurpleAccent,

                              ])
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.assignment_rounded,size: 30,color: Colors.lightBlueAccent,),
                                SizedBox(width: 5,),
                                Text("Présentation de la (FST)",textAlign: TextAlign.center,style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("La Faculté des Sciences et Techniques (FST) de l'Université de Nouakchott a été créée en 1995. Sa Mission est: l’enseignement, la recherche, et la réalisation d’expertises. La Faculté des Sciences et Techniques (FST) de l'Université de Nouakchott compte 1150 étudiants encadrés par 95 enseignants-chercheurs.",textAlign: TextAlign.start,style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )
                            ),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Présentation de la département de physique",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YoutubePlayer(controller: _controller2,
                    showVideoProgressIndicator: true,
                  ),
                ),

              ],
            ),
        ),
      ),
    );
  }
}
