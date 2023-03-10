import 'package:flutter/material.dart';

Widget iconWithText(String text, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.black.withOpacity(0.7),
        size: 17,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.7)),
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
