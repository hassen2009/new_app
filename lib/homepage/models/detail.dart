import 'package:flutter/material.dart';
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
              height: 150,
              color: Colors.deepPurpleAccent,
            ),
          )
        ],
      ),
    );
  }
}
