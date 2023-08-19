import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height : 120,
      padding: const EdgeInsets.symmetric(horizontal : 25,vertical: 30),
      child:  Stack(
        children: [
          TextField(
            decoration: InputDecoration(
                filled: true,

              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20),
                borderSide:  BorderSide(
                  color: Colors.black54,
                  width: 1,
                  style: BorderStyle.solid,
                ),

              ),
              prefixIcon:  Icon(Icons.search_outlined,size:30, color:Theme.of(context).colorScheme.secondary),
              hintText: 'Recherche',
              helperStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.withOpacity(0.4)
              ),
              focusedBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.blueAccent
                )
              )
            ),
          ),
          Positioned(
            right: 12,
              bottom: 12,
              child: Container(
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                child:  Icon(
                    Icons.mic_outlined,
                  size: 25,
                ),

              ),
          )
        ],
      ),
    );
  }
}
