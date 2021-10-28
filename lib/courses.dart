
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course {
  String titel;
  String subTitel;
  String description;
  String image;
  Widget rating;
  Course(this.titel, this.subTitel, this.description, this.image, this.rating);
}