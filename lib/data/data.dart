import 'package:flc_swe/models/profile.dart';
import 'package:flutter/material.dart';

class Store {
  static Map<String, Map<String, Profile>> profiles = {
    "2020-2021": {
      "sofiamingote": Profile(
          name: "Sofia Mingote",
          standing: "Junior",
          uid: "sofiamingote",
          years: "2020-2021",
          position: "boardmember",
          imageURL: "assets/images/SofiaImage.jpeg"),
      "ekinatay": Profile(
          name: "Ekin Atay",
          standing: "Sophomore",
          uid: "ekinatay",
          years: "2020-2021",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "arielweitzenfeld": Profile(
          name: "Ariel Weitzenfeld",
          standing: "Sophomore",
          uid: "arielweitzenfeld",
          years: "2020-2021",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "aliu1": Profile(
          name: "Alex Liu",
          standing: "Junior",
          uid: "aliu1",
          years: "2020-2021",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "lewisdaniel": Profile(
          name: "Daniel Lewis",
          standing: "Sophomore",
          uid: "lewisdaniel",
          years: "2020-2021",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
    },
    "2019-2020": {
      "ekinatay": Profile(
          name: "Ekin Atay",
          standing: "Sophomore",
          uid: "ekinatay",
          years: "2019-2020",
          position: "boardmember",
          imageURL: "assets/images/headshot.png"),
      "arielweitzenfeld": Profile(
          name: "Ariel Weitzenfeld",
          standing: "Sophomore",
          uid: "arielweitzenfeld",
          years: "2019-2020",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "aliu1": Profile(
          name: "Alex Liu",
          standing: "Junior",
          uid: "aliu1",
          years: "2019-2020",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "lewisdaniel": Profile(
          name: "Daniel Lewis",
          standing: "Sophomore",
          uid: "lewisdaniel",
          years: "2019-2020",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
    },
    "2018-2019": {
      "ekinatay": Profile(
          name: "Ekin Atay",
          standing: "Sophomore",
          uid: "ekinatay",
          years: "2018-2019",
          position: "boardmember",
          imageURL: "assets/images/headshot.png"),
      "arielweitzenfeld": Profile(
          name: "Ariel Weitzenfeld",
          standing: "Sophomore",
          uid: "arielweitzenfeld",
          years: "2018-2019",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "aliu1": Profile(
          name: "Alex Liu",
          standing: "Junior",
          uid: "aliu1",
          years: "2018-2019",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "lewisdaniel": Profile(
          name: "Daniel Lewis",
          standing: "Sophmore",
          uid: "lewisdaniel",
          years: "2018-2019",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
    },
    "2017-2018": {
      "ekinatay": Profile(
          name: "Ekin Atay",
          standing: "Sophmore",
          uid: "ekinatay",
          years: "2017-2018",
          position: "boardmember",
          imageURL: "assets/images/headshot.png"),
      "arielweitzenfeld": Profile(
          name: "Ariel Weitzenfeld",
          standing: "Sophmore",
          uid: "arielweitzenfeld",
          years: "2017-2018",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "aliu1": Profile(
          name: "Alex Liu",
          standing: "Junior",
          uid: "aliu1",
          years: "2017-2018",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
      "lewisdaniel": Profile(
          name: "Daniel Lewis",
          standing: "Sophmore",
          uid: "lewisdaniel",
          years: "2017-2018",
          position: "councilmember",
          imageURL: "assets/images/headshot.png"),
    },
  };

  dynamic getProfiles() {
    return profiles;
  }
}
