import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String name;
  final String uid;
  final String years;
  final String imageUrl;
  final String position;

  Profile({this.name, this.uid, this.years, this.imageUrl, this.position});

  factory Profile.fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return Profile(
      uid: doc.id,
      name: doc.data()['name'],
      imageUrl: doc.data()['image_url'],
    );
  }

}