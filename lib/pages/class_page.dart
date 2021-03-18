import 'dart:math';

import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/general/profile_card.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ClassPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String year;
  final Map<Color, int> colors = {
    Style.theme.accentColor: 0,
    Style.theme.primaryColor: 0,
    Style.theme.cardColor: 0
  };

  ClassPage({Key key, @required this.year}) : super(key: key);

  Widget build(BuildContext context) {
    print((1000 / 260));
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        resizeToAvoidBottomInset: false,
        // drawer:
        // sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
        //     sizingInformation.deviceScreenType == DeviceScreenType.tablet ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(double.maxFinite),
            child: NavigationBar(scaffoldkey: _scaffoldKey)),
        body: BoundingBox(
          width: sizingInformation.screenSize.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  year + " PROFILES",
                  style: Style.theme.textTheme.headline3,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: sizingInformation.screenSize.width > 1000
                            ? ((1000 / 260).floor() * 260 +
                                    ((1000 / 260).floor() - 1) * 30.0) +
                                80
                            : sizingInformation.screenSize.width,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  "BOARDMEMBERS",
                                  style: Style.theme.textTheme.headline4,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: sizingInformation.screenSize.width > 1000
                                  ? (1000 / 260).floor() * 260 +
                                      ((1000 / 260).floor() - 1) * 30.0
                                  : (sizingInformation.screenSize.width / 260)
                                              .floor() *
                                          260 +
                                      ((sizingInformation.screenSize.width /
                                                      260)
                                                  .floor() -
                                              1) *
                                          30.0,
                              child: Column(
                                children: [
                                  Wrap(
                                    spacing: 30,
                                    runSpacing: 30,
                                    children: [
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(height: 40),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  "COUNCILMEMBERS",
                                  style: Style.theme.textTheme.headline4,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: sizingInformation.screenSize.width > 1000
                                  ? (1000 / 260).floor() * 260 +
                                      ((1000 / 260).floor() - 1) * 30.0
                                  : (sizingInformation.screenSize.width / 260)
                                              .floor() *
                                          260 +
                                      ((sizingInformation.screenSize.width /
                                                      260)
                                                  .floor() -
                                              1) *
                                          30.0,
                              child: Column(
                                children: [
                                  Wrap(
                                    spacing: 30,
                                    runSpacing: 30,
                                    children: [
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                      ProfileCard(color: selectRand()),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }

  Color selectRand() {
    int minVal = colors.values.reduce(min);
    List<Color> selectables = [];
    Random random = Random();

    colors.forEach((k, v) {
      if (v == minVal) {
        selectables.add(k);
      }
    });

    Color col = selectables[random.nextInt(selectables.length)];
    colors[col]++;
    return col;
  }
}
