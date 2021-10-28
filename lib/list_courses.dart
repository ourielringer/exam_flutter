import 'dart:convert';

import 'package:exane_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'courses.dart';


class UdemyCourses extends StatefulWidget {

  String name;
  UdemyCourses(this.name);

  @override
  _UdemyCoursesState createState() => new _UdemyCoursesState(name);
}



class _UdemyCoursesState extends State<UdemyCourses> {

  String name;
  late bool isRating;
  List<Widget> courses =[];
  List coursesDetails =[];

  _UdemyCoursesState(this.name);


  @override
  void initState()  {
    print('initState');
    pullData();
  }

  Future<void> pullData() async {
    print("pulldata1");
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    coursesDetails =  data['courses'];
    print("pulldata");
    creatListWidjet();
  }

  void creatListWidjet(){
    var rating = Row(
      children: creatListIcon()
    ) ;
    for (var cours in coursesDetails) {
      print("cours image::  ${cours['image']}" );
      Widget child =  newItem(cours['titel'],cours['image'],rating);
      courses.add(child);
    }
  }


  List<Widget> creatListIcon() {

    isRating=true;
    print(isRating);
    List<IconButton> listIcons =[];

    for (int i=0; i<5; i++){
      IconButton iconButton = IconButton(
        key: Key(i.toString()),
        icon : isRating? Icon(Icons.star): Icon(Icons.favorite),color: Colors.yellow,
        onPressed: ratinge,
      );
      listIcons.add(iconButton);
    }
   return listIcons;
  }


  void ratinge(){
    setState(() {
      isRating = !isRating;
    });
  }


  Widget newItem(String titel, String image, Widget rating){
    Container child = Container(
      margin: EdgeInsets.only(bottom: 15),
        height: 100,
        child:Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5),
              ),
              child: Image.asset(image)
            ),
            Expanded(
                child:Container(
                   color: Colors.yellowAccent,
                   child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:  MainAxisAlignment.spaceAround,
                      children: [
                        Text(titel),
                        rating
                      ],
                  )
              )
            )


            // )
          ],
        ),
      );

    return child;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:  Text('Udemy courses'),
        backgroundColor: Colors.deepPurpleAccent,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15, top:15),
            child:Text(name, style: TextStyle(fontSize: 20,)
              ,)
          )
        ],
      ),
      body: Container(
        child:  ListView(
          children: courses,
        ),
      ),
    );
  }
}