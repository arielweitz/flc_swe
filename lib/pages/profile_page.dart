import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/components/navbar/navbar_components.dart';
import 'package:flc_swe/models/profile.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Profile profile;

  ProfilePage({Key key, @required this.profile}) : super(key: key);

  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
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
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 60),
              Wrap(
                runSpacing: 30,
                spacing: 40,
                children: [
                  Container(
                      color: Theme.of(context).primaryColor,
                      height: 600,
                      width: MediaQuery.of(context).size.width > 1440
                          ? 1080 / 3
                          : MediaQuery.of(context).size.width > 1225 //1150
                              ? (MediaQuery.of(context).size.width - 350) /
                                  3 // - 200
                              : MediaQuery.of(context).size.width > 1100
                                  ? (MediaQuery.of(context).size.width - 200) /
                                      3
                                  : MediaQuery.of(context).size.width > 900
                                      ? MediaQuery.of(context).size.width - 500
                                      : MediaQuery.of(context).size.width - 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: ((1080 / 3) - 260) / 2),
                            child: Image.network(profile.imageURL,
                                height: 260,
                                //260
                                width: MediaQuery.of(context).size.width > 1440
                                    ? 260
                                    : MediaQuery.of(context).size.width > 1100
                                        ? (MediaQuery.of(context).size.width -
                                                200) /
                                            3
                                        : 260,
                                fit: BoxFit.fitWidth),
                          ),
                          Container(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('NAME',
                                          style: Style.theme.textTheme.subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('YEAR',
                                          style: Style.theme.textTheme.subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('POSITION',
                                          style: Style.theme.textTheme.subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('MAJOR',
                                          style: Style.theme.textTheme.subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text(profile.name,
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text(profile.years,
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text(profile.position,
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text(profile.major,
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    color: Theme.of(context).accentColor,
                    //600
                    height:
                        MediaQuery.of(context).size.width < 1150 ? 700 : 600,
                    width: MediaQuery.of(context).size.width > 1440
                        ? 1080 * 2 / 3
                        : MediaQuery.of(context).size.width > 1100 //1150
                            ? (MediaQuery.of(context).size.width - 200) * 2 / 3
                            : MediaQuery.of(context).size.width - 100,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('ABOUT ME',
                                style: Style.theme.textTheme.subtitle2.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 32)),
                          ),
                          Container(
                            height: 2,
                            color: Style.theme.primaryColor,
                          ),
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 30,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width >
                                                    1440
                                                ? 1080 * 2 / 7.5
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1150
                                                    ? (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            200) *
                                                        2 /
                                                        7.5
                                                    : (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        200),
                                      ),
                                      // looking for row
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text('LOOKING FOR',
                                                style: Style
                                                    .theme.textTheme.subtitle2
                                                    .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                          ),
                                          Wrap(
                                              direction: Axis.vertical,
                                              spacing: 5.0,
                                              children:
                                                  makeList(profile.lookingFor)),
                                        ],
                                      ),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width >
                                                    1440
                                                ? 1080 * 2 / 7.5
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1150
                                                    ? (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            200) *
                                                        2 /
                                                        7.5
                                                    : (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        200),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text('FLC COMMITTEES',
                                                style: Style
                                                    .theme.textTheme.subtitle2
                                                    .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                          ),
                                          Wrap(
                                              direction: Axis.vertical,
                                              spacing: 5.0,
                                              children: makeList(profile
                                                  .committees
                                                  .split(', '))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 50, bottom: 35),
                                      child: Text(profile.bio,
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('CONTACT ME',
                                style: Style.theme.textTheme.subtitle2.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 32)),
                          ),
                          Wrap(
                            children: [
                              Container(
                                color: Theme.of(context).primaryColor,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.mail,
                                            color: Colors.white, size: 14),
                                        Text(
                                          profile.email,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              //fontStyle: FontStyle.italic,
                                              fontFamily: 'Roboto Condensed',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.inbox,
                                            color: Colors.white, size: 14),
                                        Text(profile.linkedin,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                //fontStyle: FontStyle.italic,
                                                fontFamily: 'Roboto Condensed',
                                                fontSize: 14)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.call,
                                            color: Colors.white, size: 14),
                                        Text(profile.phone,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                //fontStyle: FontStyle.italic,
                                                fontFamily: 'Roboto Condensed',
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  List<Widget> makeList(List<String> objs) {
    List<Widget> list = [];
    for (int i = 0; i < objs.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(objs[i],
              style: Style.theme.textTheme.subtitle2.copyWith(
                fontSize: 18,
              )),
        ),
      );
    }
    return list;
  }
}
