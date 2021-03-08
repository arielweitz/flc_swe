import 'package:flc_swe/theme/style.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}

// class ClickableNavBarItem extends StatelessWidget {
//   final Widget child;
//   final String route;
//   final bool logOut;

//   const ClickableNavBarItem({@required this.child, @required this.route, this.logOut = false});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         splashColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         focusColor: Colors.transparent,
//         onTap: () {
//           if (this.logOut) {
//             context.read<FirebaseAuthService>().signOut();
//           }
//           FluroRouter.router.navigateTo(
//               context,
//               route,
//               transition: fluro.TransitionType.fadeIn,
//               transitionDuration: Duration(milliseconds: 150));
//         },
//         child: child
//     );
//   }
// }

class NavBarItem extends StatelessWidget {
  final String title;
  const NavBarItem({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Style.theme.textTheme.headline5,
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          NavBarItem(title: title),
        ],
      ),
    );
  }
}

// class NavigationDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 24.0,
//             ),
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'Find a phone', icon: Icons.phone_iphone),
//               route: HomeRoute,
//             ),
//             DrawerItem(title: 'Sell your phone', icon: Icons.phone_iphone),
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'About us', icon: Icons.help),
//               route: AboutRoute,
//             ),
//             ModalRoute.of(context).settings.name != AccountRoute &&
//                 ModalRoute.of(context).settings.name != OrdersRoute &&
//                 ModalRoute.of(context).settings.name != MessagesRoute &&
//                 ModalRoute.of(context).settings.name != MyPhonesRoute &&
//                 ModalRoute.of(context).settings.name != SettingsRoute &&
//                 ModalRoute.of(context).settings.name != AddAPhoneRoute &&
//                 ModalRoute.of(context).settings.name != SendAMessageRoute ?
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'Account', icon: Icons.person),
//               route: AccountRoute,
//             ) : const SizedBox.shrink(),
//             ModalRoute.of(context).settings.name == AccountRoute ||
//                 ModalRoute.of(context).settings.name == OrdersRoute ||
//                 ModalRoute.of(context).settings.name == MessagesRoute ||
//                 ModalRoute.of(context).settings.name == MyPhonesRoute ||
//                 ModalRoute.of(context).settings.name == SettingsRoute ||
//                 ModalRoute.of(context).settings.name == AddAPhoneRoute ||
//                 ModalRoute.of(context).settings.name == SendAMessageRoute ?
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'Dashboard', icon: Icons.person),
//               route: AccountRoute,
//             ) : const SizedBox.shrink(),
//             ModalRoute.of(context).settings.name == AccountRoute ||
//                 ModalRoute.of(context).settings.name == OrdersRoute ||
//                 ModalRoute.of(context).settings.name == MessagesRoute ||
//                 ModalRoute.of(context).settings.name == MyPhonesRoute ||
//                 ModalRoute.of(context).settings.name == SettingsRoute ||
//                 ModalRoute.of(context).settings.name == AddAPhoneRoute ||
//                 ModalRoute.of(context).settings.name == SendAMessageRoute ?
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'Orders', icon: Icons.person),
//               route: OrdersRoute,
//             ) : const SizedBox.shrink(),
//             ModalRoute.of(context).settings.name == AccountRoute ||
//                 ModalRoute.of(context).settings.name == OrdersRoute ||
//                 ModalRoute.of(context).settings.name == MessagesRoute ||
//                 ModalRoute.of(context).settings.name == MyPhonesRoute ||
//                 ModalRoute.of(context).settings.name == SettingsRoute ||
//                 ModalRoute.of(context).settings.name == AddAPhoneRoute||
//                 ModalRoute.of(context).settings.name == SendAMessageRoute ?
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'Messages', icon: Icons.person),
//               route: MessagesRoute,
//             ) : const SizedBox.shrink(),
//             ModalRoute.of(context).settings.name == AccountRoute ||
//                 ModalRoute.of(context).settings.name == OrdersRoute ||
//                 ModalRoute.of(context).settings.name == MessagesRoute ||
//                 ModalRoute.of(context).settings.name == MyPhonesRoute ||
//                 ModalRoute.of(context).settings.name == SettingsRoute ||
//                 ModalRoute.of(context).settings.name == AddAPhoneRoute||
//                 ModalRoute.of(context).settings.name == SendAMessageRoute ?
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'My phones', icon: Icons.person),
//               route: MyPhonesRoute,
//             ) : const SizedBox.shrink(),
//             ModalRoute.of(context).settings.name == AccountRoute ||
//                 ModalRoute.of(context).settings.name == OrdersRoute ||
//                 ModalRoute.of(context).settings.name == MessagesRoute ||
//                 ModalRoute.of(context).settings.name == MyPhonesRoute ||
//                 ModalRoute.of(context).settings.name == SettingsRoute ||
//                 ModalRoute.of(context).settings.name == AddAPhoneRoute||
//                 ModalRoute.of(context).settings.name == SendAMessageRoute ?
//             ClickableNavBarItem(
//               child: DrawerItem(title: 'Settings', icon: Icons.person),
//               route: SettingsRoute,
//             ) : const SizedBox.shrink(),
//             Consumer<UserModel>(
//               builder: (_, user, __) {
//                 if (user == null) {
//                   return const SizedBox.shrink();
//                 } else {
//                   return Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 420.0 >= 0 ? MediaQuery.of(context).size.height - 420.0 : 0),
//                     child: ClickableNavBarItem(
//                       child: DrawerItem(title: 'Sign out', icon: Icons.logout),
//                       route: HomeRoute,
//                       logOut: true,
//                     ),
//                   );
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
