import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/base/taskcontroller.dart';
import 'package:new_app/empl/empl1.dart';
import 'package:new_app/empl/mtrbtn.dart';
import 'package:new_app/empl/theme.dart';
import '../base/task.dart';
import '../base/tasktile.dart';

class emploi extends StatefulWidget {
  const emploi({Key? key}) : super(key: key);

  @override
  State<emploi> createState() => _emploiState();
}

class _emploiState extends State<emploi> {
  DateTime  _selectedDate = DateTime.now();
  int i=1;

  final _taskController = Get.put(TaskController());

  @override
  void initState(){
    super.initState();
    setState(() {
      print("I am here");
    });
  }
  @override
  Widget build(BuildContext context) {
    print("build method called");
    return  Container(

   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       _Matiere(),
       _adddatebar(),
       _showtask(),
     ],
   ),
    );
  }
  _showtask(){
   return Expanded(
       child: Obx((){
         return ListView.builder(
           itemCount: _taskController.taskList.length,
             itemBuilder: (_, index){
               Task task  = _taskController.taskList[index];
               print(task.toJson());
               if(task.repeat=='Chaque jour'){
                return AnimationConfiguration.staggeredList(
                     position: index, child: SlideAnimation(
                   child: FadeInAnimation(
                     child: Row(
                       children: [
                         GestureDetector(
                           onTap: (){
                             _showbuttonsheet(context, task);
                           },
                           child: TaskTile(task),
                         )
                       ],
                     ),
                   ),
                 )
                 );
               }
               for(int j=1;j<12;j++){
                 i=7*j;
               if(task.repeat=='Chaque semaine'&&task.date==DateFormat.yMd().format(_selectedDate.subtract(Duration(days:i)))){
                 _selectedDate=_selectedDate.subtract(Duration(days:7));
                 return AnimationConfiguration.staggeredList(
                     position: index, child: SlideAnimation(
                   child: FadeInAnimation(
                     child: Row(
                       children: [
                         GestureDetector(
                           onTap: (){
                             _showbuttonsheet(context, task);
                           },
                           child: TaskTile(task),
                         )
                       ],
                     ),
                   ),
                 )
                 );
               }
               };
               if(task.date==DateFormat.yMd().format(_selectedDate)){
                return AnimationConfiguration.staggeredList(
                    position: index, child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            _showbuttonsheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ],
                    ),
                  ),
                )
                );
               }
               else{
                 return Container();
               }

         });
   }),
   );
  }
  _adddatebar(){
    return  Column(
      children: [
        Container(
          //color: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 90,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.deepPurpleAccent,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey
                  )
              ),
              dayTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey
                  )
              ),
              monthTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey
                  )
              ),
              onDateChange: (date){
                setState(() {
                  _selectedDate = date;
                });
              },
              locale: const Locale('fr','FR').toString(),
            ),

        ),
        SizedBox(height: 15,)
      ],
    );
  }
  _Matiere(){
    return Container(
      //color: Colors.yellow,
      height: 110,
      margin: EdgeInsets.only(top: 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children : [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emploi", style: GoogleFonts.lato(
                       textStyle: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 30
                       ),
                    ),
                    ),
                  SizedBox(height: 4,),
                  Row(children: [
                    Text(
                     "Aujourd'hui,", style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.grey[600]
                      ),
                    ),
                    ),
                    Text(
                      DateFormat.yMMMMd('fr_FR').format(DateTime.now()), style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.grey[600]
                      ),
                    ),
                    ),
                  ],)
                  ],
                ),
               ]
              ),
            ),
            empbtn(label: " +  Matière ",
                ontap:() async {
             await Get.to(()=>  mbutton()) ;
             _taskController.getTasks();
            } ),
          ]
      ),
    );
  }
  _showbuttonsheet(BuildContext context, Task task){
   Get.bottomSheet(
     Container(
       padding: const EdgeInsets.only(top: 6),
        height: task.isCompleted==1||task.isTP==1?MediaQuery.of(context).size.height*0.30:
        MediaQuery.of(context).size.height*0.40,
         color: Theme.of(context).colorScheme.background,
         child: Column(
         children: [
           Container(
             height: 6,
             width: 120,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey[400]
             ),
           ),
           Spacer(),
           task.isCompleted==1||task.isTP==1?Container():_bottomsheet(
             label: "TD",
             onTap: (){
               _taskController.marktaskTd(task.id!);
               Get.back();
             },
             Clr: Colors.deepPurple[300]!,
             context : context
           ),
           task.isTP==1|| task.isCompleted==1?Container():_bottomsheet(
               label: "TP",
               onTap: (){
                 _taskController.marktaskTP(task.id!);
                 Get.back();
               },
               Clr: Colors.green[500]!,
               context : context
           ),
           _bottomsheet(
               label: "Supprimer",
               onTap: (){
                 _taskController.delete(task);
                 Get.back();
               },
               Clr: Colors.red[300]!,
               context : context
           ),
           SizedBox(height: 20,),
           _bottomsheet(
               label: "Annuler",
               onTap: (){
                 Get.back();
               },
               Clr: Get.isDarkMode?Colors.white:Colors.black,
               isClose: true,
               context : context
           ),
           SizedBox(height: 10,)
       ],
     ),

     )
   );
  }
  _bottomsheet({
    required String label,
    required Function()? onTap,
    required Color Clr,
    required BuildContext  context,
    bool isClose=false,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 55,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isClose==true?Colors.grey[400]!:Clr
        ),
        borderRadius: BorderRadius.circular(20),
        color: isClose==true?Colors.transparent:Clr,
      ),
      child: Center(
        child: Text(
          label,
          style: isClose?Themes.titlestyle:Themes.titlestyle.copyWith(color: Colors.white),
        )
      ),

    ),
  );
  }
}

