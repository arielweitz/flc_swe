import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'navbar_components.dart';

class NavigationBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: <Widget>[
          //   ClickableNavBarItem(
          //     child: NavBarLogo(),
          //     route: HomeRoute,
          //   ),
          //   Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       ClickableNavBarItem(
          //         child: NavBarItem(title: 'Find a phone'),
          //         route: HomeRoute,
          //       ),
          //       SizedBox(
          //         width: 60,
          //       ),
          //       NavBarItem(title: 'Sell your phone'),
          //       // SizedBox(
          //       //   width: 60,
          //       // ),
          //       // ClickableNavBarItem(
          //       //     child: NavBarItem(title: 'About us'),
          //       //     route: AboutRoute,
          //       // ),
          //       ModalRoute.of(context).settings.name != AccountRoute &&
          //           ModalRoute.of(context).settings.name != OrdersRoute &&
          //           ModalRoute.of(context).settings.name != MessagesRoute &&
          //           ModalRoute.of(context).settings.name != MyPhonesRoute &&
          //           ModalRoute.of(context).settings.name != SettingsRoute &&
          //           ModalRoute.of(context).settings.name != AddAPhoneRoute &&
          //           ModalRoute.of(context).settings.name != SendAMessageRoute ?
          //         SizedBox(
          //           width: 60,
          //         ) : const SizedBox.shrink(),
          //       ModalRoute.of(context).settings.name != AccountRoute &&
          //       ModalRoute.of(context).settings.name != OrdersRoute &&
          //       ModalRoute.of(context).settings.name != MessagesRoute &&
          //       ModalRoute.of(context).settings.name != MyPhonesRoute &&
          //       ModalRoute.of(context).settings.name != SettingsRoute &&
          //       ModalRoute.of(context).settings.name != AddAPhoneRoute &&
          //       ModalRoute.of(context).settings.name != SendAMessageRoute ?
          //         ClickableNavBarItem(
          //           child: NavBarItem(title: 'Account'),
          //           route: AccountRoute,
          //         ) : const SizedBox.shrink(),
          //       Consumer<UserModel>(
          //         builder: (_, user, __) {
          //           if (user == null) {
          //             return const SizedBox.shrink();
          //           } else {
          //             return Row(
          //               children: [
          //                 SizedBox(
          //                   width: 60,
          //                 ),
          //                 ClickableNavBarItem(
          //                   child: NavBarItem(title: 'Log out'),
          //                   route: HomeRoute,
          //                   logOut: true,
          //                 ),
          //               ],
          //             );
          //           }
          //         },
          //       )
          //     ],
          //   )
          // ],
          ),
    );
  }
}
