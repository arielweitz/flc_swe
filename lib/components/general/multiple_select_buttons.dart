import 'package:flc_swe/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MultipleSelectList extends StatelessWidget {
  final String title;
  final Map<String, bool> options;
  final Function onPressed;

  MultipleSelectList({this.options, this.title, this.onPressed});

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

  List<Widget> buildOptions(Map<String, bool> poss) {
    List<Widget> choices = [];
    poss.forEach((k, v) {
      choices.add(MultipleSelectButton(
        title: k,
        chosen: v,
        onPressed: onPressed,
      ));
    });
    return choices;
  }
}

class MultipleSelectButton extends StatelessWidget {
  final String title;
  final bool chosen;
  final Function onPressed;

  MultipleSelectButton({this.title, this.chosen, this.onPressed});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onPressed(title, !chosen),
          child: Row(
            children: [
              Container(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    color: chosen ? Style.theme.primaryColor : Colors.white,
                  ),
                  width: 20.0,
                  height: 20.0,
                  padding: const EdgeInsets.all(2.0), // bordee width
                  decoration: new BoxDecoration(
                    color: Style.theme.primaryColor, // border color
                    shape: BoxShape.rectangle,
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
