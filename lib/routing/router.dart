import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flc_swe/data/data.dart';
import 'package:flc_swe/models/user.dart';
import 'package:flc_swe/pages/admin_page.dart';
import 'package:flc_swe/pages/class_page.dart';
import 'package:flc_swe/pages/class_select_page.dart';
import 'package:flc_swe/pages/home_page.dart';
import 'package:flc_swe/pages/login_page.dart';
import 'package:flc_swe/pages/profile_page.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FluroRouter {
  static fluro.FluroRouter router = fluro.FluroRouter();

  static fluro.Handler _homehandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    Store obj = Store();
    //Future<bool> _resp = obj.setProfiles();
    return FutureBuilder<QuerySnapshot>(
      // Initialize FlutterFire:
      future: obj.fbProfiles(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          obj.setProfiles(snapshot.data);
          return HomePage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  });

  static fluro.Handler _profilesHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    Store obj = Store();

    return FutureBuilder<QuerySnapshot>(
      // Initialize FlutterFire:
      future: obj.fbProfiles(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          obj.setProfiles(snapshot.data);
          var profiles = obj.getProfiles();
          if (params['uid'][0] == '') {
            return ClassPage(
                year: params['years'][0],
                profiles: profiles[params['years'][0]]);
          } else {
            return ProfilePage(
                profile: profiles[params['years'][0]][params['uid'][0]]);
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  });

  static fluro.Handler _classesHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    Store obj = Store();
    //Future<bool> _resp = obj.setProfiles();
    return FutureBuilder<QuerySnapshot>(
      // Initialize FlutterFire:
      future: obj.fbProfiles(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          obj.setProfiles(snapshot.data);
          //print(obj.getProfiles());
          return ClassSelectPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  });

  static fluro.Handler _adminHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    Store obj = Store();
    return Consumer<UserModel>(
      builder: (context, user, __) {
        if (user != null) {
          return FutureBuilder<QuerySnapshot>(
            // Initialize FlutterFire:
            future: obj.fbProfiles(),
            builder: (context, snapshot) {
              // Check for errors
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              // Once complete, show your application
              if (snapshot.connectionState == ConnectionState.done) {
                obj.setProfiles(snapshot.data);
                //print(obj.getProfiles());
                return AdminPage();
              }

              // Otherwise, show something whilst waiting for initialization to complete
              return CircularProgressIndicator();
            },
          );
        } else {
          return FutureBuilder<QuerySnapshot>(
            // Initialize FlutterFire:
            future: obj.fbProfiles(),
            builder: (context, snapshot) {
              // Check for errors
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              // Once complete, show your application
              if (snapshot.connectionState == ConnectionState.done) {
                obj.setProfiles(snapshot.data);
                return HomePage();
              }

              // Otherwise, show something whilst waiting for initialization to complete
              return CircularProgressIndicator();
            },
          );
        }
      },
    );
  });

  static fluro.Handler _loginHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Consumer<UserModel>(
      builder: (context, user, __) {
        if (user != null) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  });

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
      '/login/',
      handler: _loginHandler,
    );
    router.define(
      '/login',
      handler: _loginHandler,
    );
    router.define(
      '/admin/',
      handler: _adminHandler,
    );
    router.define(
      '/admin',
      handler: _adminHandler,
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
