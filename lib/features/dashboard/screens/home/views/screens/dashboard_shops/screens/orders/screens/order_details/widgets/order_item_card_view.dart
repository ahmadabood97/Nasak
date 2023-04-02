import 'package:flutter/material.dart';

Widget orderItemCardView() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "1",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kentucky Lovers [Mittel,26cm]',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 45, 82),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'mit Jalapenos, mit Mozzarella, mit Rinderbeef, mit Bacon, amerikanisch, mit Rinderbeef, mit Bacon, amerikanisch',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
