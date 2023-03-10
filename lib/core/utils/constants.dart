import 'package:flutter/material.dart';

class Constants {
  static double defaultPadding = 20.0;
  static double defaultBorderRadius = 15.0;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
