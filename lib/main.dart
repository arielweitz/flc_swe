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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLC',
      debugShowCheckedModeBanner: false,
      theme: Style.theme,
      //initialRoute: HomeRoute,
      home: HomePage(),
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
