import 'package:flc_swe/models/user.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/theme/style.dart';
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
              // IconButton(
              //   icon: Icon(Icons.account_circle),
              //   iconSize: 42.0,
              //   color: Colors.white,
              //   onPressed: () {
              //     FluroRouter.router.navigateTo(
              //         context,
              //         LoginRoute,
              //         transition: fluro.TransitionType.fadeIn,
              //         transitionDuration: Duration(milliseconds: 150));
              //   },
              // )
              // ModalRoute.of(context).settings.name != HomeRoute &&
              //     ModalRoute.of(context).settings.name != ProfilesRoute &&
              //     ModalRoute.of(context).settings.name != ClassesRoute &&
              //     ModalRoute.of(context).settings.name != MyPhonesRoute &&
              //     ModalRoute.of(context).settings.name != SettingsRoute &&
              //     ModalRoute.of(context).settings.name != AddAPhoneRoute &&
              //     ModalRoute.of(context).settings.name != SendAMessageRoute ?
              //   SizedBox(
              //     width: 60,
              //   ) : const SizedBox.shrink(),
              // ModalRoute.of(context).settings.name != AccountRoute &&
              // ModalRoute.of(context).settings.name != OrdersRoute &&
              // ModalRoute.of(context).settings.name != MessagesRoute &&
              // ModalRoute.of(context).settings.name != MyPhonesRoute &&
              // ModalRoute.of(context).settings.name != SettingsRoute &&
              // ModalRoute.of(context).settings.name != AddAPhoneRoute &&
              // ModalRoute.of(context).settings.name != SendAMessageRoute ?
              //   ClickableNavBarItem(
              //     child: NavBarItem(title: 'Account'),
              //     route: AccountRoute,
              //   ) : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
