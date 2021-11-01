import 'dart:collection';

import 'package:exane_flutter/courses.dart';
import 'package:flutter/material.dart';


class ItemDetaile extends StatefulWidget {
  @override
  _ItemDetaileState createState() => new _ItemDetaileState(detaile);

  Course detaile;
  ItemDetaile(this.detaile);
}

class _ItemDetaileState extends State<ItemDetaile> {

  Course detaile;
  _ItemDetaileState(this.detaile);

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 20,
        // title: Text(detaile.titel,
        //     style:TextStyle(
        //       fontSize: 13,
        //       overflow: TextOverflow.ellipsis
        //     )
        // ),
        backgroundColor: Colors.deepPurpleAccent,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0,50.0),
            child: Text(
              detaile.titel,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
          preferredSize: Size(0.0, 80.0),
        ),
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(32.0),
        child: ListView(

          children: [
        Align(
        alignment: Alignment.center,
          child:Container(
              height:90,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.deepPurpleAccent,
                    style: BorderStyle.solid
                  )
                ),
                child: Image.asset(detaile.image)
            ),
        ),
            SizedBox(height: 10),
            Container(
                child: Text(detaile.subTitel, style: TextStyle(fontSize: 12),)
            ),
            SizedBox(height: 10),
            Text("Description", style: TextStyle(fontSize: 20)),
            Text(detaile.description)
          ],
        ),
      ),
  );
}
}
//
// return Scaffold(
//
// body:CustomScrollView(
// slivers:[
// SliverMultilineAppBar(
// title: "Summer Trip jjjjjjjjjjjj jjjjjjjjjjjjjjjjjythy thjytjytjyjtmyujyueyhw4s",
// ),
// ],
// ),

// class SliverMultilineAppBar extends StatelessWidget {
//   final String title;
//
//   SliverMultilineAppBar({required this.title});
//
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//
//     double availableWidth = mediaQuery.size.width - 160;
//
//     return SliverAppBar(
//       expandedHeight: 90,
//       forceElevated: true,
//       flexibleSpace: FlexibleSpaceBar(
//         title: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: availableWidth,
//           ),
//           child: Text(title, textScaleFactor: 0.6,),
//         ),
//       ),
//     );
//   }
// }
