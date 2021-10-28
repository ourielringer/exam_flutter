import 'dart:ffi';

import 'package:flutter/material.dart';

import 'list_courses.dart';



class Login extends StatefulWidget {
  @override
  State createState() => new Login_State();
}

class Login_State extends State<Login> {

 String username ='';
 String _password ='';
 final _controler = TextEditingController();
 late bool _validate ;
 late bool _progresBarBull ;

 // final _formKey = GlobalKey<FormState>();

 @override
  void initState() {
   _validate = false;
   _progresBarBull = false;
  }

 void _onSubmittedUsername(String value){
   setState(() {
    username = value;
    if(!_password.isEmpty){
      print('trr1');
      _validate =true;
    }
   });
 }

 void _onSubmittedPassword(String value){
   setState(() {
    _password = value;
    if(!username.isEmpty){
      print('trr2');
      _validate=true;
    }
   });
 }

 void _login(){
   print("loginnnn");
   if (username.length>0 && _password.length>0) {
     print('login2');
     setState(() {
       _progresBarBull = true;
       Future.delayed(Duration(seconds: 3),(){
         Navigator.push(context, MaterialPageRoute(
             builder:(BuildContext context)=>UdemyCourses(_controler.text)
         )
         );
       });
     });
   }

 }


@override
Widget build(BuildContext context) {
   var progresBar = Container(
       child:Center(
         child: Stack(
             fit:StackFit.loose,
             alignment: AlignmentDirectional.bottomCenter,
             children: [
               CircularProgressIndicator(
                 value: null,
                 strokeWidth: 7,
               ),
             ],
           ) ,
       )
   );

  var bodyProgress = new Container(
    child: new Stack(
      children: <Widget>[
        new Container(
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            color: Colors.white70,
          ),
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.blue[200],
                borderRadius: new BorderRadius.circular(10.0)
            ),
            width: 300.0,
            height: 200.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: new CircularProgressIndicator(
                      value: null,
                      strokeWidth: 7.0,
                    ),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: new Center(
                    child: new Text(
                      "loading.. wait...",
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  
  return _progresBarBull? progresBar : Scaffold(
    backgroundColor:(Color(0xffe0e0e0)),
    body:ListView(
      children: [
        Text(username),
        Text(_password),
        Container(
          // padding:  EdgeInsets.only(top: 100,bottom: 30),
            child: Column(
                children:  [
                  Container(
                    padding: EdgeInsets.all(80),
                    child:Form(
                      child: Column(
                      children: [
                        TextField(
                          controller: _controler,
                          decoration: InputDecoration(
                            border:OutlineInputBorder() ,
                            hintText: 'Enter Name Here',
                            filled: true,
                            fillColor: Colors.white,
                            // enabledBorder: UnderlineInputBorder(
                            //
                            //   borderRadius: new BorderRadius.circular(0.0),
                            // ),
                          ),
                          autofocus: false,
                          onSubmitted: _onSubmittedUsername,
                        ),
                        SizedBox(height: 40),
                        TextField(
                            decoration: InputDecoration(
                            border:OutlineInputBorder() ,
                            hintText: 'Enter Passwor Here',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          autofocus: false,
                          obscureText: true,
                          onSubmitted: _onSubmittedPassword,
                        ),
                      ],
                    ),
                    )
                  ),
                  Image.asset(
                    'images/image5.png',
                    width:400,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width:500,
                    padding: EdgeInsets.all(80),
                    child: ElevatedButton(onPressed: _validate? _login: null,
                      child:Text(
                        'Login'
                        ,style: TextStyle(
                          color: Colors.black,
                          fontSize:18,
                      ),),
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent) ,
                        overlayColor: MaterialStateProperty.all<Color>(Colors.blue) ,
                      ),
                    ) ,
                  ),
                ]
            )
        )
      ],
    ) ,
  );
}
}