import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/general/buttons.dart';
import 'package:flc_swe/components/general/input_field.dart';
import 'package:flc_swe/components/general/one_select_buttons.dart';
import 'package:flc_swe/components/general/profile_card.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/components/navbar/navbar_components.dart';
import 'package:flc_swe/data/data.dart';
import 'dart:math';
import 'package:flc_swe/models/profile.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/routing/router.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Store obj = Store();
  final List<String> years = [];

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
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    "SELECT A YEAR",
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

  List<ClassAdminButton> generateButtons() {
    List<ClassAdminButton> buttons = [];
    years.sort((b, a) => a.compareTo(b));
    for (int i = 0; i < years.length; i++) {
      buttons.add(ClassAdminButton(
        text: years[i],
      ));
      //print(years[i] + ' ' + i.toString());
    }
    buttons.add(ClassAdminButton(
      text: '+',
    ));
    return buttons;
  }
}

class AddYear extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _yearKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'syear': TextEditingController(),
    'eyear': TextEditingController()
  };

  @override
  Widget build(BuildContext context) {
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
                    "ADD A YEAR",
                    style: Style.theme.textTheme.headline3,
                  ),
                ),
                SizedBox(
                  width: sizingInformation.screenSize.width > 860
                      ? 800
                      : sizingInformation.screenSize.width - 60,
                  child: Form(
                    key: _yearKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputField(
                              text: 'Start Year',
                              controller: _controllers['syear'],
                              type: InputType.Year),
                          InputField(
                              text: 'End Year',
                              controller: _controllers['eyear'],
                              type: InputType.Year),
                          SizedBox(
                            height: 24.0,
                          ),
                          PrimaryButton(
                              title: 'ADD',
                              onPressed: () async {
                                if (_yearKey.currentState.validate()) {
                                  try {
                                    Store obj = Store();
                                    obj.addYearGroup(
                                        _controllers['syear'].text +
                                            '-' +
                                            _controllers['eyear'].text);
                                    FluroRouter.router.navigateTo(
                                        context, AdminRoute,
                                        transition: fluro.TransitionType.fadeIn,
                                        transitionDuration:
                                            Duration(milliseconds: 150));
                                  } catch (e) {
                                    print(e.toString());
                                    String message = '';
                                    message = 'Sorry, an error has occurred.';

                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                Style.theme.primaryColor,
                                            content: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12.0, bottom: 18.0),
                                              child: Text(message,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4
                                                      .copyWith(
                                                          color: Colors.white)),
                                            )));
                                  }

                                  // FirebaseAuth.instance
                                  //     .authStateChanges()
                                  //     .listen((User user) {
                                  //   if (user != null) {
                                  //     FluroRouter.router.navigateTo(
                                  //         context, HomeRoute,
                                  //         transition:
                                  //             fluro.TransitionType.fadeIn,
                                  //         transitionDuration:
                                  //             Duration(milliseconds: 150));
                                  //   }
                                  // });
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClassAdminPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String year;
  final Map<String, Profile> profiles;
  final Map<Color, int> colors = {
    Style.theme.accentColor: 0,
    Style.theme.primaryColor: 0,
    Style.theme.cardColor: 0
  };

  ClassAdminPage({Key key, @required this.year, @required this.profiles})
      : super(key: key);

  Widget build(BuildContext context) {
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      spacing: 40,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          year + " PROFILES",
                          style: Style.theme.textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                        DeleteButton(year: year)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: sizingInformation.screenSize.width > 1000
                      ? ((1000 / 280).floor() * 280 +
                              ((1000 / 280).floor() - 1) * 30.0) +
                          80
                      : sizingInformation.screenSize.width,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10),
                          child: Text(
                            "BOARDMEMBERS",
                            style: Style.theme.textTheme.headline4,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sizingInformation.screenSize.width > 1000
                            ? (1000 / 280).floor() * 280 +
                                ((1000 / 280).floor() - 1) * 30.0
                            : (sizingInformation.screenSize.width / 280)
                                        .floor() *
                                    280 +
                                ((sizingInformation.screenSize.width / 280)
                                            .floor() -
                                        1) *
                                    30.0,
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 30,
                              runSpacing: 30,
                              children: makeCards("Boardmember"),
                              // ProfileCard(color: selectRand()),
                              // ProfileCard(color: selectRand()),
                              // ProfileCard(color: selectRand()),
                              // ProfileCard(color: selectRand()),
                              // ,
                            ),
                          ],
                        ),
                      ),
                      Container(height: 40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10),
                          child: Text(
                            "COUNCILMEMBERS",
                            style: Style.theme.textTheme.headline4,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sizingInformation.screenSize.width > 1000
                            ? (1000 / 280).floor() * 280 +
                                ((1000 / 280).floor() - 1) * 30.0
                            : (sizingInformation.screenSize.width / 280)
                                        .floor() *
                                    280 +
                                ((sizingInformation.screenSize.width / 280)
                                            .floor() -
                                        1) *
                                    30.0,
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 30,
                              runSpacing: 30,
                              children: makeCards("Councilmember"),
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

  List<Widget> makeCards(String type) {
    List<Widget> cards = [];
    if (type == "Boardmember")
      cards.add(
          ProfileAdminCard(year: year, color: selectRand(), profile: null));
    profiles.values.forEach((v) {
      if (v.position == type)
        cards
            .add(ProfileAdminCard(year: year, color: selectRand(), profile: v));
    });

    if (type == "Councilmember")
      cards.add(
          ProfileAdminCard(year: year, color: selectRand(), profile: null));
    return cards;
  }
}

class EditProfile extends StatefulWidget {
  final Profile profile;
  final String years;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _profileKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'name': TextEditingController(),
    //'id': TextEditingController(),
    'major': TextEditingController(),
    //year is passed in
    'bio': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'linkedin': TextEditingController()
  };
  EditProfile({Key key, @required this.years, @required this.profile})
      : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //name, id, major, position, year, bio, list of LOOKING FOR, list of committees, phone, email, lnkedin

  String position;
  String standing;

  @override
  void initState() {
    if (widget.profile != null) {
      widget._controllers["name"].text = widget.profile.name;
      widget._controllers["major"].text = widget.profile.major;
      widget._controllers["bio"].text = widget.profile.bio;
      widget._controllers["email"].text = widget.profile.email;
      widget._controllers["phone"].text = widget.profile.phone;
      widget._controllers["linkedin"].text = widget.profile.linkedin;
    }
    setState(() {
      position = widget.profile != null ? widget.profile.position : "";
      standing = widget.profile != null ? widget.profile.standing : "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        key: widget._scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(double.maxFinite),
            child: NavigationBar(scaffoldkey: widget._scaffoldKey)),
        body: BoundingBox(
          width: sizingInformation.screenSize.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    "EDIT PROFILE",
                    style: Style.theme.textTheme.headline3,
                  ),
                ),
                SizedBox(
                  width: sizingInformation.screenSize.width > 860
                      ? 800
                      : sizingInformation.screenSize.width - 60,
                  child: Form(
                    key: widget._profileKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputField(
                              text: 'Name',
                              controller: widget._controllers['name'],
                              type: InputType.Text),
                          OneSelectList(
                            title: "Position",
                            chosen: position,
                            options: ["Councilmember", "Boardmember"],
                            onPressed: (String name) => setState(() {
                              position = name;
                            }),
                          ),
                          OneSelectList(
                            title: "Standing",
                            chosen: standing,
                            options: [
                              "Freshman",
                              "Sophmore",
                              "Junior",
                              "Senior"
                            ],
                            onPressed: (String name) => setState(() {
                              standing = name;
                            }),
                          ),
                          InputField(
                              text: 'Major',
                              controller: widget._controllers['major'],
                              type: InputType.Text),
                          InputField(
                              text: 'Bio',
                              controller: widget._controllers['bio'],
                              type: InputType.Multiline),
                          InputField(
                              text: 'UFL Email',
                              controller: widget._controllers['email'],
                              type: InputType.UFLEmail),
                          InputField(
                              text: 'Phone Number',
                              controller: widget._controllers['phone'],
                              type: InputType.Phone),
                          InputField(
                              text: 'Linkedin URL',
                              controller: widget._controllers['linkedin'],
                              type: InputType.Text),
                          SizedBox(
                            height: 24.0,
                          ),
                          Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              PrimaryButton(
                                  title: 'CANCEL',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              PrimaryButton(
                                  title:
                                      widget.profile == null ? 'ADD' : 'SAVE',
                                  onPressed: () async {
                                    if (widget._profileKey.currentState
                                        .validate()) {
                                      try {
                                        Profile temp = Profile(
                                          name:
                                              widget._controllers['name'].text,
                                          position: position,
                                          major:
                                              widget._controllers['major'].text,
                                          bio: widget._controllers['bio'].text,
                                          email:
                                              widget._controllers['email'].text,
                                          phone:
                                              widget._controllers['phone'].text,
                                          linkedin: widget
                                              ._controllers['linkedin'].text,
                                          uid: widget._controllers['email'].text
                                              .substring(
                                                  0,
                                                  widget._controllers['email']
                                                      .text
                                                      .indexOf('@')),
                                          years: widget.years,
                                          standing: standing,
                                          imageURL: "_link_",
                                        );
                                        Store obj = Store();
                                        await obj.addProfileInfo(temp);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FutureBuilder<QuerySnapshot>(
                                                    // Initialize FlutterFire:
                                                    future: obj.fbProfiles(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Check for errors
                                                      if (snapshot.hasError) {
                                                        return Text(snapshot
                                                            .error
                                                            .toString());
                                                      }

                                                      // Once complete, show your application
                                                      if (snapshot.hasData) {
                                                        obj.setProfiles(
                                                            snapshot.data);
                                                        //print(obj.getProfiles());
                                                        return ClassAdminPage(
                                                          year: widget.years,
                                                          profiles:
                                                              obj.getProfiles()[
                                                                  widget.years],
                                                        );
                                                      }

                                                      // Otherwise, show something whilst waiting for initialization to complete
                                                      return CircularProgressIndicator();
                                                    },
                                                  )
                                              // ClassAdminPage(
                                              //   year: widget.years,
                                              //   profiles: obj.getProfiles()[
                                              //       widget.years],
                                              // )
                                              ),
                                        );
                                      } catch (e) {
                                        print(e.toString());
                                        String message = '';
                                        message =
                                            'Sorry, an error has occurred.';

                                        widget._scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    Style.theme.primaryColor,
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 18.0),
                                                  child: Text(message,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                                )));
                                      }

                                      // FirebaseAuth.instance
                                      //     .authStateChanges()
                                      //     .listen((User user) {
                                      //   if (user != null) {
                                      //     FluroRouter.router.navigateTo(
                                      //         context, HomeRoute,
                                      //         transition:
                                      //             fluro.TransitionType.fadeIn,
                                      //         transitionDuration:
                                      //             Duration(milliseconds: 150));
                                      //   }
                                      // });
                                    }
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
