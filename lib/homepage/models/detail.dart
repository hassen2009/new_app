import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Centrales.dart';
import 'delegate.dart';

class detaille extends StatelessWidget {
  const detaille(this.wasf,{super.key});
 final  Pic wasf  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: DetailSliverDelegate(
                wasf: wasf,
                expandedHeight : 360,
        roudedContainerHeight : 20,
      )
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 800,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.greenAccent,
                              CupertinoColors.systemGreen,
                              Colors.green,
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
                                    Icon(Icons.lightbulb_rounded,size: 40,color: Colors.greenAccent,),
                                    SizedBox(width: 8,),
                                    Text("PRESENTATION DE LA FILIERE",style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white
                                      )
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Cette formation a pour objet de doter les étudiants d'un solide formation en ingenierie electrique permettant une integration active dans le secteur industriel",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.lato(
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
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.greenAccent.withOpacity(0.6),
                                    Colors.blueAccent,
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
                                    Icon(Icons.lightbulb_rounded,size: 40,color: Colors.greenAccent.withOpacity(0.8),),
                                    SizedBox(width: 8,),
                                    Text("CONDITIONS D'ADMISSION",style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white
                                        )
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("-   Avoir rempli les conditions de passage de L1 vers L2 en MPI ou PC.                                                               -   Selection de dossiers",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.lato(
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
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.greenAccent.withOpacity(0.6),
                                    Colors.blue.withOpacity(0.8),
                                    Colors.blueAccent,
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
                                    Icon(Icons.lightbulb_rounded,size: 40,color: Colors.greenAccent.withOpacity(0.8),),
                                    SizedBox(width: 8,),
                                    Text("DEBOUCHES",style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white
                                        )
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text("Cette formation permet aux sortants : De travailler comme technicien de genie electrique , de presenter aux concours des grandes ecoles et de continuer leurs etudes des masters professionnel ou de recherche",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.lato(
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
            ),
          )
        ],
      ),
    );
  }
}
