import 'package:firebase_core/firebase_core.dart';
import 'package:flc_swe/pages/home_page.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/routing/router.dart';
import 'package:flc_swe/services/firebase_auth_service.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  FluroRouter.setupRouter();
  runApp(MultiProvider(providers: [
    Provider(
      create: (_) => FirebaseAuthService(),
    ),
    StreamProvider(
      create: (context) =>
          context.read<FirebaseAuthService>().onAuthStateChanged,
    )
  ], child: FLC()));
}

class FLC extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'FLC',
            debugShowCheckedModeBanner: false,
            theme: Style.theme,
            initialRoute: HomeRoute,
            onGenerateRoute: FluroRouter.router.generator,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
