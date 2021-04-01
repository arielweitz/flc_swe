import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/general/profile_card.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flc_swe/models/profile.dart';
import 'package:flc_swe/backend/ProfileImages1.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height - 120);
    final _currentUser = Provider.of<Profile>(context);
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                ProfileCard(),
                SizedBox(height: 20),
                OutlineButton(
                  onPressed: () {
                    uploadProfileImageToStorage(_currentUser);
                  },
                  child: Text('Update Profile Picture'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}