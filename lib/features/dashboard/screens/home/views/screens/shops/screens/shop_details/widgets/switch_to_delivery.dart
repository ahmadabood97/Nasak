import 'package:flutter/material.dart';

import '../../../../../../../../../../core/utils/hex_colors.dart';

Widget switchToDelivery() {
  return Container(
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    color: const Color.fromARGB(255, 255, 250, 248),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.info_outline),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                "You're about to place a pickup order, if you do not want to pick up, please change it here to delivery.",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text("Switch to delivery",
            style: TextStyle(
                color: HexColor("e57744"),
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
