import 'package:flc_swe/components/navbar/navbar_desktop.dart';
import 'package:flc_swe/components/navbar/navbar_mobile.dart';
import 'package:flc_swe/components/navbar/navbar_tablet.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const NavigationBar({@required this.scaffoldkey});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Container(
          padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: NavigationBarMobile(scaffoldkey: scaffoldkey)),
      tablet: Container(
          padding: const EdgeInsets.only(top: 40.0, left: 45.0, right: 45.0),
          child: NavigationBarTablet(scaffoldkey: scaffoldkey)),
      desktop: Container(
          color: Style.theme.primaryColor,
          padding: EdgeInsets.only(
              top: 40.0,
              left: MediaQuery.of(context).size.width > 1440 + 140
                  ? (MediaQuery.of(context).size.width - 1440) / 2
                  : 70.0,
              right: MediaQuery.of(context).size.width > 1440 + 140
                  ? (MediaQuery.of(context).size.width - 1440) / 2
                  : 70.0),
          child: NavigationBarDesktop()),
    );
  }
}
