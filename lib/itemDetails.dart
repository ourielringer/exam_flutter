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
        title: Text(detaile.titel,
            style:TextStyle(
              fontSize: 15,
              overflow: TextOverflow.ellipsis
            )
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Container(
              height: 100,
                decoration: BoxDecoration(
                ),
                child: Image.asset(detaile.image)
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