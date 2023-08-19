import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 20,
        right: 35,
      ),
      height : 100,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Accueil',
              style: TextStyle(
                fontSize: 30,
                color: Get.isDarkMode?Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                fontFamily: "Poppins-Bold"
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text('Chercher votre emploi',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins-Bold"
            ),
          ),
          ],
          ),

        ],
      ),
    );
  }

}
