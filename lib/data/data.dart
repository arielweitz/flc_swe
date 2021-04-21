import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flc_swe/models/profile.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

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
    info.docs.forEach((result) {
      Map<String, Profile> profMap = {};
      yr = result.id;
      result.data().forEach((key, value) {
        id = key.toString();
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
            committees: value['committees'].toString(),
            lookingFor: List<String>.from(value['lookingFor']));
      });
      profiles[yr] = profMap;
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
        'email': p.email,
        'committees': p.committees,
        'lookingFor': p.lookingFor
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

  /*
  * Function to upload image from files
  */
  void uploadImage({@required Function(File file) onSelected}) {
    /* Opens file selector window upon click */
    InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    /* 
    * Waits for a change from input element
    * to begin uploading image
    */
    uploadInput.onChange.listen((event) {
      final file =
          uploadInput.files.first; /* Refers to first file selected in window */
      final reader = FileReader(); /* Asynchronously read file contents */
      reader.readAsDataUrl(file); /* File is read as a URL */
      reader.onLoadEnd.listen((event) {
        /* Wait for file upload to finish */
        onSelected(file);
      });
    });
  }

  Future<Uri> addImageToStore(String year, String uid, File file) async {
    fb.StorageReference ref = await fb.storage().ref().child('$year/$uid');
    fb.UploadTask uploadTask = await ref.put(file);
    Future<Uri> temp;
    await uploadTask.future.whenComplete(() => temp = ref.getDownloadURL());
    return temp;
  }
}
