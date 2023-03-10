import 'package:flutter/material.dart';

Widget addressDetails() {
  return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Delivered to:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 45, 82),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Augustinusstrase 17, 41460, نويس",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ));
}
