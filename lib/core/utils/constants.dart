import 'package:flutter/material.dart';

import 'hex_colors.dart';

class Constants {
  static double defaultPadding = 20.0;
  static double defaultBorderRadius = 15.0;
  static int startHour = 1;
  static int endHour = 22;
  static Color primaryColor = HexColor("f07a60");

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
