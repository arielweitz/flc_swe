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
                spacing: 30,
                children: [
                  Container(
                      color: Theme.of(context).primaryColor,
                      height: 600,
                      width: MediaQuery.of(context).size.width > 1440
                          ? 1080 / 3
                          : MediaQuery.of(context).size.width > 1150
                              ? (MediaQuery.of(context).size.width - 200) / 3
                              : MediaQuery.of(context).size.width - 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: ((1080 / 3) - 260) / 2),
                            child: Image.asset(
                              'assets/images/SofiaImage.jpeg',
                              height: 260,
                              width: 260,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ((1080 / 3) - 260) / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      child: Text('NAME',
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('YEAR',
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('POSITION',
                                          style:
                                              Style.theme.textTheme.subtitle2),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('MAJOR',
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
                    height: 600,
                    width: MediaQuery.of(context).size.width > 1440
                        ? 1080 * 2 / 3
                        : MediaQuery.of(context).size.width > 1150
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text('LOOKING FOR',
                                                style: Style
                                                    .theme.textTheme.subtitle2
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text('A HUG',
                                                style: Style
                                                    .theme.textTheme.subtitle2),
                                          ),
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
                                                        fontWeight:
                                                            FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Text('ALL OF EM',
                                                style: Style
                                                    .theme.textTheme.subtitle2),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text(
                                          "According to all known laws of aviation, there is no way that a bee should be able to fly. Its wings are too small to get its fat little body off the ground. The bee, of course, flies anyway. Because bees don’t care what humans think is impossible.",
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
                          Container(
                            height: 2,
                            color: Style.theme.primaryColor,
                          ),
                          Wrap(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.mail,
                                      color: Colors.white, size: 14),
                                  Text('test@test.com',
                                      style: Style.theme.textTheme.bodyText1)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.inbox,
                                      color: Colors.white, size: 14),
                                  Text('linkedin/test',
                                      style: Style.theme.textTheme.bodyText1)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.call,
                                      color: Colors.white, size: 14),
                                  Text('813-###-####',
                                      style: Style.theme.textTheme.bodyText1)
                                ],
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
}

// body: BoundingBox(
//           width: sizingInformation.screenSize.width,
//           child: Column(
//             children: [
//               Container(height: 80),
//               Expanded(
//                 child: SingleChildScrollView(
//                   // main row to have all columns inside
//                   child: Column(
//                     children: [
//                       Wrap(
//                         spacing: 30,
//                         runSpacing: 30,
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           // headshot + name
//                           Container(
//                             height: MediaQuery.of(context).size.height - 180,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 0, horizontal: 20),
//                                     color: Theme.of(context).primaryColor,
//                                     width: 270,
//                                     height: MediaQuery.of(context).size.height -
//                                         350,
//                                     // picture, name, and year column
//                                     child: Column(
//                                         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 35),
//                                             child: Center(
//                                               child: Container(
//                                                 height: 200, width: 200,
//                                                 decoration: new BoxDecoration(
//                                                     image: new DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   alignment: FractionalOffset
//                                                       .topCenter,
//                                                   image: AssetImage(
//                                                       profile.imageURL),
//                                                 )),
//                                                 // child: profile.image, height: 200, width: 200)
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 30),
//                                             child: Text(profile.name,
//                                                 style: Style
//                                                     .theme.textTheme.headline5),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 50),
//                                             child: Text(
//                                                 profile.years +
//                                                     ' ' +
//                                                     profile.position,
//                                                 style: Style
//                                                     .theme.textTheme.headline5),
//                                           ),
//                                         ])),
//                               ],
//                             ),
//                           ),

//                           // contact info and projects column
//                           Container(
//                             height: MediaQuery.of(context).size.height - 180,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // contact info container
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 20.0),
//                                   child: Container(
//                                       width: 170,
//                                       height: 170,
//                                       // for rounded edges
//                                       decoration: BoxDecoration(
//                                           color: Theme.of(context).accentColor,
//                                           border: Border.all(
//                                             color:
//                                                 Theme.of(context).accentColor,
//                                           ),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(5))),
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 30, horizontal: 20),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           RichText(
//                                             text: TextSpan(
//                                               children: [
//                                                 WidgetSpan(
//                                                   child: Icon(
//                                                     Icons.mail,
//                                                     size: 14,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 TextSpan(
//                                                     text:
//                                                         "  johnedoe@gmail.com",
//                                                     style: Style.theme.textTheme
//                                                         .bodyText1),
//                                               ],
//                                             ),
//                                           ),
//                                           RichText(
//                                             text: TextSpan(
//                                               children: [
//                                                 WidgetSpan(
//                                                   child: Icon(
//                                                     Icons.inbox,
//                                                     size: 14,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 TextSpan(
//                                                     text:
//                                                         "  linkedin.com/johndoe",
//                                                     style: Style.theme.textTheme
//                                                         .bodyText1),
//                                               ],
//                                             ),
//                                           ),
//                                           RichText(
//                                             text: TextSpan(
//                                               children: [
//                                                 WidgetSpan(
//                                                   child: Icon(
//                                                     Icons.call,
//                                                     size: 14,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 TextSpan(
//                                                     text: "  (###)-###_####",
//                                                     style: Style.theme.textTheme
//                                                         .bodyText1),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       )),
//                                 ),

//                                 // projects title and image column
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 20.0),
//                                   child: Column(
//                                     children: <Widget>[
//                                       Container(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 20, vertical: 20),
//                                         color: Theme.of(context).cardColor,
//                                         width: 250,
//                                         child: Text('Projects',
//                                             style: Style
//                                                 .theme.textTheme.headline5),
//                                       ),
//                                       Image.asset('assets/images/hp1.jpg',
//                                           height: 250, width: 250),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // facts and about me column
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // quick facts container
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 20.0),
//                                 child: Container(
//                                     width: 250,
//                                     height: 300,
//                                     color: Theme.of(context).primaryColor,
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 30, horizontal: 20),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Major: Computer Science",
//                                           style:
//                                               Style.theme.textTheme.bodyText1,
//                                         ),
//                                         Text(
//                                           "School: College of Liberal Arts and Sciences",
//                                           style:
//                                               Style.theme.textTheme.bodyText1,
//                                         ),
//                                         Text(
//                                           "FLC Committees: ",
//                                           style:
//                                               Style.theme.textTheme.bodyText1,
//                                         ),
//                                         Text(
//                                           "Looking for: ",
//                                           style:
//                                               Style.theme.textTheme.bodyText1,
//                                         ),
//                                       ],
//                                     )),
//                               ),

//                               // about me container
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 20.0),
//                                 child: Container(
//                                     width: 250,
//                                     height: 170,
//                                     color: Style.theme.accentColor,
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 30),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               WidgetSpan(
//                                                 child: Icon(
//                                                   Icons.person,
//                                                   size: 30,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                   text: "  About Me",
//                                                   style: Style.theme.textTheme
//                                                       .headline5),
//                                             ],
//                                           ),
//                                         ),
//                                         Text(
//                                           'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore magna aliqua. Ut enim ad minim veniam.',
//                                           style:
//                                               Style.theme.textTheme.bodyText1,
//                                         )
//                                       ],
//                                     )),
//                               ),
//                             ],
//                           ),

//                           Container(
//                             height: MediaQuery.of(context).size.height - 180,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 10, horizontal: 10),
//                                   color: Theme.of(context).cardColor,
//                                   width: 290,
//                                   height: 600,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Image.asset('assets/images/hp1.jpg',
//                                           height: 250, width: 250),
//                                       Container(height: 20),
//                                       Image.asset('assets/images/hp1.jpg',
//                                           height: 250, width: 250),
//                                       Container(height: 10),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
