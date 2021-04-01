/* Profile Picture Source Code */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flc_swe/models/profile.dart';
import 'package:firebase/firebase.dart' as fb;
import 'dart:html';

/*
 * Collection: TestProfile
 * Document: 2020-2021
 * Field: aliu1
 *    Name: Alex Liu
 *    Years: 2020-2021
 *    Position: Council Member
 *    imageURL: store image name and then get url later, or get url here from image name
 * 
 */

/*
 * Function to get url of image
 * Parameter1: Council Years
 * Parameter2: 'profile_images' or uid
 * Parameter3: Name of Image
 * Allows url of image to be retrieved from unique image name (uid or other)
 * gs://flc-swe.appspot.com/2020-2021/aliu1/profile_image
 */
Future<Uri> downloadUrl(String years, String folder2, String imageName) {
  return fb
      .storage()
      .refFromURL('gs://flc-swe.appspot.com/')
      .child(years)
      .child(folder2)
      .child(imageName)
      .getDownloadURL();
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
    final file = uploadInput.files.first;         /* Refers to first file selected in window */
    final reader = FileReader();                  /* Asynchronously read file contents */
    reader.readAsDataUrl(file);                   /* File is read as a URL */
    reader.onLoadEnd.listen((event) {             /* Wait for file upload to finish */
      onSelected(file);
    });
  });
}

/*
 * Function to upload non profile image files to Firebase Storage
 * Parameter: User instance
 */
void uploadToStorage(Profile user) {
  final userYears = user.years;                   /* Get user year */
  final userId = user.uid;                        /* Get user ID */
  final path = '$userYears/$userId/';             /* Path = Folder (Year) + Folder (UID) */
  uploadImage(
    /* Store image file in Firebase */
    onSelected: (file) {
      fb
        .storage()
        .refFromURL('gs://flc-swe.appspot.com/')
        .child(path)
        .child(file.name)
        .put(file);                               /* Store image file here gs://flc-swe.appspot.com/2020-2021/aliu1/image_name */
        /* 
         * Update profile picture of corresponding user automatically in firestore collection 
         * TestProfile -> 2020-2021 -> 
         */
        // .future
        // .then((_) {
        //   FirebaseFirestore.instance
        //   .collection('TestProfile')
        //   .doc(user.years)
        //   .update({'imageUrl': user.uid});
        // });
    },
  );
}

/*
 * Function to upload profile image file to Firebase Storage
 * Parameter: User instance
 */
void uploadProfileImageToStorage(Profile user) async {
  final userYears = user.years;                        /* Get user year */
  final profile_images = 'profile_images';
  final userId = user.uid;                             /* Get user ID */
  final path = '$userYears/$profile_images/$userId';   /* Path = folder/folder/image */
  
  uploadImage(
    /* Store image file in Firebase */
    onSelected: (file) {
      fb
        .storage()
        .refFromURL('gs://flc-swe.appspot.com/')
        .child(path)
        .put(file);                                /* Store image file here gs://flc-swe.appspot.com/2020-2021/profile_images/aliu1 */
    },
  );

  /* 
   * Update profile picture of corresponding user automatically in firestore collection 
   * TestProfile -> 2020-2021 -> ProfileName -> imageUrl
   */
  final imageUrl = await downloadUrl(userYears, profile_images, userId);
  FirebaseFirestore
  .instance.collection('TestProfile')
  .doc(user.years)
  .update({'imageUrl': imageUrl});
}