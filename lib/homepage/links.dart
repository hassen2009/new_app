import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class pagelinks extends StatefulWidget {
  const pagelinks({super.key});

  @override
  State<pagelinks> createState() => _pagelinksState();
}

class _pagelinksState extends State<pagelinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        height: 1000,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurple,
                          ])
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,top: 12),
                        child: Icon(Icons.messenger,size: 40,color: Colors.deepPurpleAccent,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("L'université de Nouakchott est composée de quatre facultés, d'un institut, d'un centre et de plusieurs laboratoires de recherche : Faculté des Lettres et Sciences Humaines (FLSH), Faculté des Sciences Juridiques et Économiques (FSJE),Faculté des Sciences et Techniques (FST),Faculté de Médecine (FM)",textAlign: TextAlign.start,style: GoogleFonts.lato(
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurple,
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
                            Icon(Icons.messenger,size: 40,color: Colors.deepPurpleAccent,),
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
          ],
        ),
      ),
    );
  }
}
