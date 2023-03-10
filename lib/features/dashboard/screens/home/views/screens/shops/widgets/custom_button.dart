import 'package:flutter/material.dart';

Widget customButton(BuildContext context, String title, Color colorText,
    Color colorBackground) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 7),
    height: 50,
    decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: Colors.grey.withOpacity(0.5))),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorText,
        ),
      ),
    ),
  );
}
