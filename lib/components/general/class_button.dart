import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/routing/router.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';

class ClassButton extends StatelessWidget {
  final String year;
  const ClassButton({@required this.year});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
                BorderSide(width: 4, color: Style.theme.primaryColor)),
            foregroundColor:
                MaterialStateProperty.all(Style.theme.primaryColor),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 36))),
        onPressed: () {
          FluroRouter.router.navigateTo(context, ProfilesRoute + year + '/',
              transition: fluro.TransitionType.fadeIn,
              transitionDuration: Duration(milliseconds: 150));
        },
        child: Container(
            width: 260,
            height: 60,
            child: Center(
                child: Text(year, style: Style.theme.textTheme.headline6))));
  }
}