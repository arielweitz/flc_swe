import 'package:flc_swe/models/profile.dart';
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
    return Container(
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
                  "BOB ROSS",
                  style: Style.theme.textTheme.headline5,
                ),
                Text(
                  "SENIOR",
                  style: Style.theme.textTheme.headline5.copyWith(fontSize: 16),
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
                  child: Image.asset('assets/images/hp1.jpg',
                      height: 200, width: 200)),
            ),
          ),
        ],
      ),
    );
  }
}
