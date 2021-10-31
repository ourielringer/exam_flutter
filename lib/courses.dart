
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course {
  String titel;
  String subTitel;
  String description;
  String image;

  Course(this.titel, this.subTitel, this.description, this.image);

  factory Course.fromJson(dynamic json) {
    return Course(json['titel'] as String, json['Subtitle'] as String,
        json['Description'] as String, json['image'] as String);
  }
}