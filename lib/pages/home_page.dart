import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
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
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: AssetImage('assets/images/hp1.jpg'),
                        )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: AssetImage('assets/images/hp2.jpg'),
                        )),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 120,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(255, 255, 255, 0.50),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 120,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("FLC", style: Style.theme.textTheme.headline1),
                          Text("PROFILES",
                              style: Style.theme.textTheme.headline2),
                        ],
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
