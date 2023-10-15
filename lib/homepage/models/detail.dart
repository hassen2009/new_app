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
              height: 700,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Text("La licence Électronique, Électrotechnique et Automatique (EEA) (niveau bac +3) se caractérise par sa pluridisciplinarité et son approche métier.  Dédiée aux trois grands domaines de l’EEA qui sont l’électronique, l’énergie électrique et l’automatique, son but est de former des étudiants ayant d’excellentes compétences dans ces domaines mais également en génie mécanique, génie civil, mécanique... et ainsi de préparer des futurs cadres dans le secteur de l’industrie, de l’enseignement technique.",textAlign: TextAlign.start,style: GoogleFonts.lato(
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
                                child: Icon(Icons.messenger,size: 40,color: Colors.red.withOpacity(0.7),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Au troisième et quatrième  semestre, nous étudions plusieurs matières, notamment l'Electronique Analogique , Machine Electrique et l'Electromagnetisme Avancee , et ces matières nécessitent une bonne préparation",textAlign: TextAlign.start,style: GoogleFonts.lato(
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
                    )
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
