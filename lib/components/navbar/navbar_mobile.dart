import 'package:flutter/material.dart';

import 'navbar_components.dart';

class NavigationBarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const NavigationBarMobile({@required this.scaffoldkey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: <Widget>[
          //   IconButton(
          //     splashColor: Colors.transparent,
          //     hoverColor: Colors.transparent,
          //     icon: Icon(Icons.menu, color: Colors.black, size: 32.0,),
          //     onPressed: () {
          //       scaffoldkey.currentState.openDrawer();
          //     },
          //   ),
          //   ClickableNavBarItem(
          //     child: NavBarLogo(),
          //     route: HomeRoute,
          //   ),
          //   ClickableNavBarItem(
          //     child: Icon(Icons.search, color: Colors.black, size: 32.0),
          //     route: HomeRoute,
          //   )
          // ],
          ),
    );
  }
}
