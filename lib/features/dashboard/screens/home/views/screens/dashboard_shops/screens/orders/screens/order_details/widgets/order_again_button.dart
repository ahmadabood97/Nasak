import 'package:flutter/material.dart';

Widget orderAgainButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: const Center(
        child: Text(
          "Order again",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color.fromARGB(255, 13, 111, 197),
          ),
        ),
      ),
    ),
  );
}
