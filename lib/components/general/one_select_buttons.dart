import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OneSelectList extends StatelessWidget {
  final String title;
  final String chosen;
  final List<String> options;
  final Function onPressed;

  OneSelectList({this.options, this.title, this.chosen, this.onPressed});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Style.theme.textTheme.subtitle1),
        Column(
          children: buildOptions(options),
        )
      ]),
    );
  }

  List<Widget> buildOptions(List<String> poss) {
    List<Widget> choices = [];
    for (int i = 0; i < options.length; i++) {
      choices.add(SelectButton(
        title: poss[i],
        chosen: chosen == poss[i] ? true : false,
        onPressed: onPressed,
      ));
    }
    return choices;
  }
}

class SelectButton extends StatelessWidget {
  final String title;
  final bool chosen;
  final Function onPressed;

  SelectButton({this.title, this.chosen, this.onPressed});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onPressed(title),
          child: Row(
            children: [
              Container(
                  child: CircleAvatar(
                    backgroundColor:
                        chosen ? Style.theme.primaryColor : Colors.white,
                  ),
                  width: 20.0,
                  height: 20.0,
                  padding: const EdgeInsets.all(2.0), // border width
                  decoration: new BoxDecoration(
                    color: Style.theme.primaryColor, // border color
                    shape: BoxShape.circle,
                  )),
              Container(width: 10),
              Text(
                title,
                style: Style.theme.textTheme.subtitle1.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
