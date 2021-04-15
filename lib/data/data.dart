import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flc_swe/models/profile.dart';
import 'package:flutter/material.dart';

class Store {
  static Map<String, Map<String, Profile>> profiles = {};

  dynamic getProfiles() {
    return profiles;
  }

  Future<QuerySnapshot> fbProfiles() {
    return FirebaseFirestore.instance.collection("profiles").get();
  }

  Future setProfiles(QuerySnapshot info) async {
    profiles = {};
    String yr = "";
    String id = "";
    //print("Hi");
    info.docs.forEach((result) {
      Map<String, Profile> profMap = {};
      yr = result.id;
      //print("yo");
      //print(result.data());
      result.data().forEach((key, value) {
        id = key.toString();
        //print(yr);
        //print(id);
        profMap[id] = Profile(
          name: value['name'].toString(),
          standing: value['standing'].toString(),
          uid: value['uid'].toString(),
          years: value['years'].toString(),
          position: value['position'].toString(),
          imageURL: value['imageURL'].toString(),
          email: value['email'].toString(),
          bio: value['bio'].toString(),
          phone: value['phone'].toString(),
          major: value['major'].toString(),
          linkedin: value['linkedin'].toString(),
        );
        //print(profMap.length);
      });
      profiles[yr] = profMap;
      //profMap.clear();
      //print(profiles.length);
    });
  }

  void addProfileInfo(Profile p) async {
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection('profiles').doc(p.years).set({
      p.uid: {
        'name': p.name,
        'uid': p.uid,
        'years': p.years,
        'imageURL': p.imageURL,
        'position': p.position,
        'standing': p.standing,
        'bio': p.bio,
        'phone': p.phone,
        'linkedin': p.linkedin,
        'major': p.major,
        'email': p.email
      },
    }, SetOptions(merge: true)).then((_) {
      print("success!");
    });

    await fbProfiles().then((obj) => setProfiles(obj));
  }

  void addYearGroup(String title) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    var profilesRef = db.collection('profiles').doc(title);

    profilesRef.set({}, SetOptions(merge: true)).then((_) {
      print("success!");
    });

    fbProfiles().then((obj) => setProfiles(obj));
  }

  void deleteProfile(Profile p) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    var profilesRef = db.collection('profiles').doc(p.years);

    profilesRef.update({p.uid: FieldValue.delete()});

    await fbProfiles().then((obj) => setProfiles(obj));
  }

  void deleteYear(String year) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    profiles.remove(year);
    var profilesRef = db.collection('profiles').doc(year);

    profilesRef.delete();
    await fbProfiles().then((obj) => setProfiles(obj));
  }
}
