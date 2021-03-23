import 'package:flc_swe/models/profile.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/routing/router.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:flc_swe/theme/style.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final Color color;
  final double height;
  final double width;

  const ProfileCard(
      {this.profile, @required this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    style:
                        Style.theme.textTheme.headline5.copyWith(fontSize: 16),
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
                      image: AssetImage(profile.imageURL),
                    )),
                    // child: profile.image, height: 200, width: 200)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
