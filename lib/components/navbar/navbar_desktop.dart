import 'package:flc_swe/models/user.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_components.dart';

class NavigationBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClickableNavBarItem(
            child: NavBarLogo(),
            route: HomeRoute,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClickableNavBarItem(
                child: NavBarItem(title: 'Home'),
                route: HomeRoute,
              ),
              SizedBox(
                width: 60,
              ),
              ClickableNavBarItem(
                child: NavBarItem(title: 'Profiles'),
                route: ClassesRoute,
              ),
              SizedBox(
                width: 60,
              ),
              Consumer<UserModel>(
                builder: (context, user, __) {
                  if (user != null) {
                    return Row(
                      children: [
                        ClickableNavBarItem(
                          child: NavBarItem(title: 'Admin'),
                          route: AdminRoute,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                      ],
                    );
                  } else {
                    return SizedBox(
                      width: 0,
                    );
                  }
                },
              ),
              Consumer<UserModel>(
                builder: (context, user, __) {
                  if (user != null) {
                    return ClickableNavBarItem(
                      child: NavBarItem(title: 'Log out'),
                      route: HomeRoute,
                      logOut: true,
                    );
                  } else {
                    return ClickableNavBarItem(
                      child: NavBarItem(title: 'Login'),
                      route: LoginRoute,
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
