import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_app/base/taskcontroller.dart';
import 'package:new_app/empl/empl1.dart';
import 'package:new_app/homepage/home_page.dart';
import 'package:new_app/homepage/pages.dart';
import 'package:new_app/empl/inputfields.dart';
import 'package:new_app/barpages/emploi.dart';
import '../base/task.dart';
import '../barpages/themess.dart';




class mbutton extends StatefulWidget {
  const mbutton({Key? key}) : super(key: key);

  @override
  State<mbutton> createState() => _mbuttonState();
}

class _mbuttonState extends State<mbutton> {
  DateTime _selecteddate = DateTime.now();
  String _fin = DateFormat("hh:mm a").format(DateTime.now().add(Duration(hours: 2))).toString();
  String _Debut = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _selectedrepeat = "Ne répéte pas";
  List<String> repeatlist = [
    "Ne répéte pas",
    "Chaque jour",
    "Chaque semaine",
    "Chaque mois"
  ];
  int _selectedcolor =0;
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController sallecontroller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  void deactivate() {
    super.deactivate();
    titleController.dispose();
    nameController.dispose();
    sallecontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
       leading: GestureDetector(
         onTap: (){
          Get.back();
         },
         child: Icon(Icons.arrow_back_ios,),
       ),
   ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Matière",
             style: GoogleFonts.lato(
               textStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 30
               ),
             ) ,
             ),
              Myinputfield(title: "Matiere",hint: "Ajouter une matiere",controller: titleController  ,),
              Myinputfield(title: "Nom",hint: "Nom du professeur",controller: nameController ,),
              Myinputfield(title: "Salle",hint: "Salle",controller: sallecontroller ,),
              Myinputfield(title: "Date",hint: DateFormat.yMd().format(_selecteddate),
                  widget: IconButton(
                icon: Icon(Icons.calendar_today_outlined,color: Colors.grey,),
                onPressed: (){
                  _getdate();
                },
              )
              ),
              Row(
                children: [
                  Expanded(child: Myinputfield(
                    title: "Debut",
                    hint: _Debut,
                      widget: IconButton(
                        icon: Icon(Icons.access_time_outlined,color: Colors.grey,),
                        onPressed: (){
                          _gettime(isDebut: true);
                        },
                      )
                  )),
                  SizedBox(width: 14,),
                  Expanded(child: Myinputfield(
                      title: "Fin",
                      hint: _fin,
                      widget: IconButton(
                        icon: Icon(Icons.access_time_outlined,color: Colors.grey,),
                        onPressed: (){
                          _gettime(isDebut: false);
                        },
                      )
                  ))
                ],
              ),
              Myinputfield(title: "Répéter",
                  hint: "$_selectedrepeat",
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                  iconSize: 32,
                  elevation: 4,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey[600],

                    ),
                  ),
                  underline: Container(height: 0,),
                  onChanged: (String? newValue){
                    setState(() {
                      _selectedrepeat = newValue!;
                    });
                  },
                  items: repeatlist.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value : value,
                      child: Text(value,style: TextStyle(color: Colors.grey)),
                    );
                  }).toList(),


                ),
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorpalette(),
                  empbtn(label: "Ajouter", ontap: ()=>_validyt())
                ],
              )

            ],

          ),
        ),
      ),
    );
  }
  _validyt(){
    if(titleController.text.isNotEmpty&&nameController.text.isNotEmpty&&sallecontroller.text.isNotEmpty){
        _addtoDb() ;
    Get.back();
    }
    else if(titleController.text.isEmpty || nameController.text.isEmpty||sallecontroller.text.isEmpty){
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("Remplir les autre champs",style: TextStyle(color: Colors.red),)),backgroundColor: Colors.white,)
      );
    }
  }
  _addtoDb() async {
    int value = await _taskController.addTask(
        task: Task(
         title: titleController.text,
          nom: nameController.text,
          date: DateFormat.yMd().format(_selecteddate),
          debut:_Debut,
          fin: _fin,
          salle: sallecontroller.text,
          couleur:_selectedcolor,
          repeat: _selectedrepeat,
          isCompleted: 0,
          isTP: 0,
        )
    );
    print("my id is "+"$value");
  }
  _getdate() async {
    DateTime? _pickerdate = await  showRoundedDatePicker(
        context: context,
        height: 320,
        locale: Locale("fr","FR"),
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        styleDatePicker: MaterialRoundedDatePickerStyle(
          textStyleDayButton: TextStyle(fontSize: 30, color: Colors.white),
          textStyleYearButton: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          textStyleDayHeader: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textStyleCurrentDayOnCalendar:
          TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleDayOnCalendar: TextStyle(fontSize: 20, color: Colors.white),
          textStyleDayOnCalendarSelected:
          TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.1)),
          textStyleMonthYearHeader:
          TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          sizeArrow: 30,
          colorArrowNext: Colors.white,
          colorArrowPrevious: Colors.white,
          textStyleButtonAction: TextStyle(fontSize: 18, color: Colors.white),
          textStyleButtonPositive:
          TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleButtonNegative: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.5)),
          decorationDateSelected: BoxDecoration(color: Get.isDarkMode?Colors.deepPurple:Colors.orange[600], shape: BoxShape.circle),
          backgroundPicker: Get.isDarkMode?Colors.black:Colors.deepPurple[400],
          backgroundActionBar: Get.isDarkMode?Colors.grey[900]:Colors.deepPurple[300],
          backgroundHeaderMonth: Get.isDarkMode?Colors.grey[900]:Colors.deepPurple[300],
        ),
        styleYearPicker: MaterialRoundedYearPickerStyle(
          textStyleYear: TextStyle(fontSize: 35, color: Colors.white),
          textStyleYearSelected:
          TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          heightYearRow: 40,
          backgroundPicker: Get.isDarkMode?Colors.black:Colors.deepPurple[400],
        ));
    if(_pickerdate!=null){
      setState(() {
        _selecteddate =  _pickerdate;
      });
    }
    else{
      print("erreur");
    }
  }
  _gettime({required bool isDebut}) async {
    var pickedtime = await _showTimePicker();
    String _formatedTime = pickedtime.format(context);
    if(pickedtime==null){
      print("time canceled");
    }
    else if (isDebut==true){
      setState(() {
        _Debut = _formatedTime;
      });
    }
    else if(isDebut==false){
      setState(() {
        _fin = _formatedTime;
      });
    }
  }
    _showTimePicker(){
  return showTimePicker(
    initialEntryMode: TimePickerEntryMode.input,
    context : context,
    initialTime : TimeOfDay(
        hour: int.parse(_Debut.split(":")[0]),
        minute: int.parse(_Debut.split(":")[1].split(" ")[0])
    ),
  );
    }
    _colorpalette(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Couleur",style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
        )),
        SizedBox(height: 8,),
        Wrap(
          children: List<Widget>.generate(
              4,
                  (int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedcolor=index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index==0?Colors.deepPurpleAccent:index==1?Colors.pinkAccent:index==2?Colors.orange:Colors.green,
                      child: _selectedcolor==index?const Icon(Icons.done,color: Colors.white, size: 18):Container(),
                    ),
                  ),
                );
              }
          ),
        )
      ],
    );
    }

  }

