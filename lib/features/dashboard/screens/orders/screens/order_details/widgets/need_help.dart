import 'package:flutter/material.dart';

import 'help_button.dart';

Widget needHelp() {
  return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Need help with this order:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 45, 82),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "If you have any questions or need to get in touch, we'll help you out.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),
            helpButton()
          ],
        ),
      ));
}
