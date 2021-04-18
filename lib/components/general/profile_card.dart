import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flc_swe/data/data.dart';
import 'package:flc_swe/models/profile.dart';
import 'package:flc_swe/pages/admin_page.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/routing/router.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/rendering.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final Color color;
  final double height;
  final double width;

  const ProfileCard(
      {this.profile, @required this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          FluroRouter.router.navigateTo(
              context, ProfilesRoute + profile.years + '/' + profile.uid + '/',
              transition: fluro.TransitionType.fadeIn,
              transitionDuration: Duration(milliseconds: 150));
        },
        child: Container(
          height: 340,
          width: 260,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text(
                      profile.name,
                      style: Style.theme.textTheme.headline5,
                    ),
                    Text(
                      profile.standing,
                      style: Style.theme.textTheme.headline5
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  height: 220,
                  width: 220,
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      height: 200, width: 200,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                        image: NetworkImage(profile.imageURL),
                      )),
                      // child: profile.image, height: 200, width: 200)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAdminCard extends StatelessWidget {
  final Profile profile;
  final String year;
  final Color color;
  final double height;
  final double width;

  const ProfileAdminCard(
      {this.profile,
      @required this.color,
      @required this.year,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          profile == null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () {
          profile == null
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(
                            years: year,
                            profile: profile,
                          )),
                )
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => ClassAdminPage(
              //             year: text,
              //             profiles: obj.getProfiles()[text],
              //           )),
              // );
              : () {};
        },
        child: Container(
          height: 360,
          width: 280,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 340,
                  width: 260,
                  color: color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Text(
                              profile == null ? "ADD PROFILE" : profile.name,
                              style: Style.theme.textTheme.headline5,
                            ),
                            Text(
                              profile == null ? "" : profile.standing,
                              style: Style.theme.textTheme.headline5
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          height: 220,
                          width: 220,
                          color: Colors.white,
                          child: Center(
                            child: Container(
                              height: 200, width: 200,
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                fit: BoxFit.cover,
                                alignment: FractionalOffset.topCenter,
                                image: profile == null
                                    ? AssetImage("assets/images/headshot.png")
                                    : NetworkImage(profile.imageURL),
                              )),
                              // child: profile.image, height: 200, width: 200)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              profile == null
                  ? Container(width: 0)
                  : Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2.0, 8.0),
                              blurRadius: 3.0,
                              color: Colors.black.withAlpha(15),
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: color,
                              size: 15,
                            ),
                            color: Colors.white,
                            hoverColor: Colors.grey.withAlpha(70),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                          years: year,
                                          profile: profile,
                                        )),
                              );
                            },
                          ),
                        ),
                      ),
                      top: 0,
                      left: 0),
              profile == null
                  ? Container(width: 0)
                  : Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2.0, 8.0),
                              blurRadius: 3.0,
                              color: Colors.black.withAlpha(15),
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: color,
                              size: 15,
                            ),
                            color: Colors.white,
                            hoverColor: Colors.grey.withAlpha(70),
                            onPressed: () async {
                              Store obj = Store();
                              await obj.deleteProfile(profile);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FutureBuilder<QuerySnapshot>(
                                          // Initialize FlutterFire:
                                          future: obj.fbProfiles(),
                                          builder: (context, snapshot) {
                                            // Check for errors
                                            if (snapshot.hasError) {
                                              return Text(
                                                  snapshot.error.toString());
                                            }

                                            // Once complete, show your application
                                            if (snapshot.hasData) {
                                              obj.setProfiles(snapshot.data);
                                              //print(obj.getProfiles());
                                              return ClassAdminPage(
                                                year: profile.years,
                                                profiles: obj.getProfiles()[
                                                    profile.years],
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
                            },
                          ),
                        ),
                      ),
                      top: 0,
                      right: 0),
            ],
          ),
        ),
      ),
    );
  }
}
