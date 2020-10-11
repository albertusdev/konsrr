import 'package:flutter/material.dart';

import '../constants.dart';

Widget padLeftRight(
  BuildContext context, {
  Widget child,
  double marginTop,
  double,
  marginBottom,
  bool color = true,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontalMargin).copyWith(
      top: marginTop,
      bottom: marginBottom,
    ),
    color: color ? Theme.of(context).colorScheme.surface : null,
    child: child,
  );
}

Widget padLeft(
    BuildContext context, {
      Widget child,
      double marginTop,
      double,
      marginBottom,
      bool color = true,
    }) {
  return Container(
    padding: EdgeInsets.only(left: horizontalMargin).copyWith(
      top: marginTop,
      bottom: marginBottom,
    ),
    color: color ? Theme.of(context).colorScheme.surface : null,
    child: child,
  );
}
