import 'package:flutter/material.dart';

Widget screenEmpty(IconData icon, String title, String subTitle) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: const Color.fromARGB(255, 2, 43, 78),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color.fromARGB(255, 2, 43, 78),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: 280,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
          child: const Center(
            child: Text(
              "Browse restaurants",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromARGB(255, 13, 111, 197),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
