import 'package:flutter/material.dart';

Widget customButton(Color color, String title) {
  return Container(
    decoration: BoxDecoration(
        color: color,
        borderRadius: title != "Order and pay"
            ? const BorderRadius.all(Radius.circular(3))
            : const BorderRadius.all(Radius.circular(0))),
    height: 50,
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
