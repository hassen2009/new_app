import 'package:flutter/material.dart';

import 'Centrales.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate{
  final Pic wasf;
  final double expandedHeight;
  final double roudedContainerHeight;
  DetailSliverDelegate({
    required this.wasf,
    required this.expandedHeight,
    required this.roudedContainerHeight,
});
  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent){
    return Stack(
      children: [
        Hero(tag: wasf.name, child: Image.asset(
          wasf.bgImage,width: MediaQuery.of(context).size.width,height: expandedHeight,fit: BoxFit.cover,)),
        Positioned(child: GestureDetector(
          onTap: ()=> Navigator.of(context).pop(),
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              shape: BoxShape.circle
            ),
            child: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
          ),

        )),
        Positioned(
          top: expandedHeight - roudedContainerHeight-shrinkOffset,

            child: Container(
              height: 50,
              padding: EdgeInsets.only(top: 7),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
    )
                ),
    child: Container(
    alignment: Alignment.topCenter,
    width: 60,
    height: 5,
    color: Colors.deepPurpleAccent,
    )
    ,
              ),
            )
      ],
    );

        }
        @override
  double get maxExtent => expandedHeight;
  @override
  double get minExtent =>0;
  @override
  bool  shouldRebuild(covariant  SliverPersistentHeaderDelegate oldDelegate){
    return false;
  }

}