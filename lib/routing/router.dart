import 'package:flc_swe/pages/home_page.dart';
import 'package:flc_swe/pages/profile_page.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';

class FluroRouter {
  static fluro.FluroRouter router = fluro.FluroRouter();

  static fluro.Handler _homehandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomePage());

  static fluro.Handler _profilesHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    if (params['uid'][0] == '') {
      // return ClassPage();
    } else {
      // return ProfilePage();
    }
  });

  static void setupRouter() {
    router.define(
      '/',
      handler: _homehandler,
    );
    router.define(
      '/profiles/:years/:uid',
      handler: _profilesHandler,
    );
  }
}
