import 'package:flc_swe/components/general/bounding_box.dart';
import 'package:flc_swe/components/navbar/navbar.dart';
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
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 120,
                    child: Image.asset('assets/images/homeImage.png',
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        colorBlendMode: BlendMode.modulate),
                  )
                  // Stack(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //             height: MediaQuery.of(context).size.height - 80,
                  //             child: Image.asset('assets/images/hp1.jpg')),
                  //         SizedBox(
                  //             height: MediaQuery.of(context).size.height - 80,
                  //             child: Image.asset('assets/images/hp2.jpg')),
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
