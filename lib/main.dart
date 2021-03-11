import 'package:flc_swe/pages/home_page.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(FLC());
}

class FLC extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLC',
      debugShowCheckedModeBanner: false,
      theme: Style.theme,
      // initialRoute: HomeRoute,
      // onGenerateRoute: FluroRouter.router.generator,
      home: HomePage(),
    );
  }
}
