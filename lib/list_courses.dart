import 'dart:convert';
import 'dart:typed_data';

import 'package:exane_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'courses.dart';
import 'itemDetails.dart';


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
  List<Course> coursesDetails =[];

  _UdemyCoursesState(this.name);


  @override
  void initState()  {
    print('initState');
    pullData();
  }

  Future<void> pullData() async {
    print("pulldata1");
    final String response = await rootBundle.loadString('assets/data.json');
    final  parsedData  = await json.decode(response);
    final List parsedList  = parsedData['courses'];
    coursesDetails  = parsedList.map((val) =>  Course.fromJson(val)).toList();
    creatListWidjet();
  }

  void creatListWidjet(){
    print("creatListWidjet");
    // var rating = Row(
    //     // crossAxisAlignment: CrossAxisAlignment.end,
    //     children: creatListIcon()
    // ) ;
    for (var cours in coursesDetails) {
      print("cours image::  ${cours}" );
      Widget child =  newItem(cours.titel,cours.image);
      courses.add(child);
    }
    setState(() {});
  }

  // List<Widget> creatListIcon() {
  //
  //   isRating=true;
  //   print(isRating);
  //   List <Widget>listIcons =[];
  //
  //   for (int i=0; i<5; i++){
  //     Key key = Key(i.toString());
  //     Flexible iconButton =  Flexible(
  //       fit: FlexFit.tight,
  //       flex: 1,
  //       child: IconButton(
  //         key: key,
  //         icon : isRating? Icon(Icons.star): Icon(Icons.star_border),color: Colors.yellow,
  //         onPressed: ratinge,
  //       ),
  //     );
  //     listIcons.add(iconButton);
  //   }
  //  return listIcons;
  // }
  //
  //
  // void ratinge(){
  //   setState(() {
  //     isRating = !isRating;
  //   });
  // }
  Widget newItem(String titel, String image,){
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
                   color: Colors.black12,
                   child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:  MainAxisAlignment.spaceAround,
                      children: [
                        Text(titel),
                        RatingBar.builder(
                          itemSize: 15,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                         print(rating);
                        },
                        )
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
        child:  ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            print("index ${index}");
            print("context ${context}");
            return GestureDetector(
              child: courses[index],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder:(BuildContext context)=>ItemDetaile(coursesDetails[index])
                )
                );
              }
            );
              // courses[index];
          },
        ),
          // children: courses,

      ),
    );
  }
}