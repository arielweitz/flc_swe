import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/general/profile_card.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ClassePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height - 120);
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
              Text(
                "Profiles",
                style: Style.theme.textTheme.headline1,
              ),
              Flexible(
                child: GridView.extent(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 500,
                  children: <Widget>[
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                    ProfileCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
