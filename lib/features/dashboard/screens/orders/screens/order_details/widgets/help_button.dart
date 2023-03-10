import 'package:flutter/material.dart';

Widget helpButton() {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: Colors.grey.withOpacity(0.5))),
    child: const Center(
      child: Text(
        "Get help",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Color.fromARGB(255, 13, 111, 197),
        ),
      ),
    ),
  );
}
