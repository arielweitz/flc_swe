import 'package:flc_swe/models/user.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navbar_components.dart';

class NavigationBarTablet extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;

  const NavigationBarTablet({this.scaffoldkey});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(Icons.menu, color: Colors.white, size: 32.0),
                onPressed: () {
                  scaffoldkey.currentState.openDrawer();
                },
              ),
              SizedBox(
                width: 30.0,
              ),
              ClickableNavBarItem(
                child: NavBarLogo(),
                route: HomeRoute,
              )
            ],
          ),
          Row(
            children: [
              ClickableNavBarItem(
                child: Icon(Icons.people, color: Colors.white, size: 32.0),
                route: ClassesRoute,
              ),
              Consumer<UserModel>(
                builder: (context, user, __) {
                  if (user != null) {
                    return const SizedBox.shrink();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ClickableNavBarItem(
                        child: Icon(Icons.account_circle,
                            color: Colors.white, size: 32.0),
                        route: LoginRoute,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
