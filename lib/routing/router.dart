import 'package:flc_swe/data/data.dart';
import 'package:flc_swe/pages/class_page.dart';
import 'package:flc_swe/pages/class_select_page.dart';
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
    Store obj = Store();
    var profiles = obj.getProfiles();
    if (params['uid'][0] == '') {
      return ClassPage(
          year: params['years'][0], profiles: profiles[params['years'][0]]);
    } else {
      return ProfilePage(
          profile: profiles[params['years'][0]][params['uid'][0]]);
    }
  });

  static fluro.Handler _classesHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ClassSelectPage());

  static void setupRouter() {
    router.define(
      '/',
      handler: _homehandler,
    );
    router.define(
      '/classes/',
      handler: _classesHandler,
    );
    router.define(
      '/classes',
      handler: _classesHandler,
    );
    router.define(
      '/profiles/:years/:uid',
      handler: _profilesHandler,
    );
    router.define(
      '/profiles/:years/:uid/',
      handler: _profilesHandler,
    );
  }
}
