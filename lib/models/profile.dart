import 'dart:convert';
import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String uid;
  final String years;
  final String imageURL;
  final String position;
  final String standing;

  Profile(
      {this.name,
      this.uid,
      this.years,
      this.imageURL,
      this.position,
      this.standing});
}
