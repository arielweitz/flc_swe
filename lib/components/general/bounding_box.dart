import 'package:flutter/material.dart';

class BoundingBox extends StatelessWidget {
  final Widget child;
  final double width;
  const BoundingBox({@required this.child, this.width = 1440});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: child,
      ),
    );
  }
}
