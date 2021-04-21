import 'package:flc_swe/data/data.dart';
import 'package:flc_swe/pages/admin_page.dart';
import 'package:flc_swe/routing/route_names.dart';
import 'package:flc_swe/routing/router.dart';
import 'package:flc_swe/theme/style.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const PrimaryButton({@required this.title, @required this.onPressed});

  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
                BorderSide(width: 4, color: Style.theme.primaryColor)),
            foregroundColor:
                MaterialStateProperty.all(Style.theme.primaryColor),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 36))),
        onPressed: () {
          onPressed();
        },
        child: Container(
            width: 260,
            height: 60,
            child: Center(
                child: Text(title, style: Style.theme.textTheme.headline6))));
  }
}

class ClassButton extends StatelessWidget {
  final String year;
  const ClassButton({@required this.year});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      title: year,
      onPressed: () {
        FluroRouter.router.navigateTo(context, ProfilesRoute + year + '/',
            transition: fluro.TransitionType.fadeIn,
            transitionDuration: Duration(milliseconds: 150));
      },
    );
  }
}

class ClassAdminButton extends StatelessWidget {
  final String text;
  const ClassAdminButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    Store obj = Store();
    return PrimaryButton(
      title: text,
      onPressed: () {
        if (text == '+') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddYear()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClassAdminPage(
                      year: text,
                      profiles: obj.getProfiles()[text],
                    )),
          );
        }
      },
    );
  }
}

class DeleteButton extends StatelessWidget {
  final String year;
  const DeleteButton({@required this.year});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.theme.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(2.0, 8.0),
            blurRadius: 3.0,
            color: Colors.black.withAlpha(15),
          )
        ],
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Style.theme.primaryColor,
        child: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
            size: 15,
          ),
          color: Style.theme.primaryColor,
          hoverColor: Colors.grey.withAlpha(70),
          onPressed: () async {
            Store obj = Store();
            await obj.deleteYear(year);
            FluroRouter.router.navigateTo(context, AdminRoute,
                transition: fluro.TransitionType.fadeIn,
                transitionDuration: Duration(milliseconds: 150));
          },
        ),
      ),
    );
  }
}
