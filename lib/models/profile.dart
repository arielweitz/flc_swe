import 'dart:convert';
import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String bio;
  final String email;
  final String linkedin;
  final String phone;
  final String major;
  final String uid;
  final String years;
  final String imageURL;
  final String position;
  final String standing;

  Profile(
      {this.name,
      this.uid,
      this.bio,
      this.email,
      this.linkedin,
      this.phone,
      this.major,
      this.years,
      this.imageURL,
      this.position,
      this.standing});
}
