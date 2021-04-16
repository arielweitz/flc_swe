import 'dart:math';

import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/general/buttons.dart';
import 'package:flc_swe/components/general/profile_card.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/components/navbar/navbar_components.dart';
import 'package:flc_swe/data/data.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ClassSelectPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Store obj = Store();
  final List<String> years = [];

  ClassSelectPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    years.addAll(obj.getProfiles().keys.toList());
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(double.maxFinite),
            child: NavigationBar(scaffoldkey: _scaffoldKey)),
        body: BoundingBox(
          width: sizingInformation.screenSize.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    "CLASSES",
                    style: Style.theme.textTheme.headline3,
                  ),
                ),
                SizedBox(
                  width: sizingInformation.screenSize.width > 1000
                      ? ((1000 / 260).floor() * 260 +
                              ((1000 / 260).floor() - 1) * 30.0) +
                          80
                      : sizingInformation.screenSize.width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: sizingInformation.screenSize.width > 1000
                            ? (1000 / 260).floor() * 260 +
                                ((1000 / 260).floor() - 1) * 30.0
                            : (sizingInformation.screenSize.width / 260)
                                        .floor() *
                                    260 +
                                ((sizingInformation.screenSize.width / 260)
                                            .floor() -
                                        1) *
                                    30.0,
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              children: generateButtons(),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 40),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ClassButton> generateButtons() {
    List<ClassButton> buttons = [];
    years.sort((b, a) => a.compareTo(b));
    for (int i = 0; i < years.length; i++) {
      buttons.add(ClassButton(
        year: years[i],
      ));
      //print(years[i] + ' ' + i.toString());
    }
    return buttons;
  }
}
