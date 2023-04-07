import 'package:flutter/material.dart';

Widget deliveryCosts() {
  return Column(
    children: [
      const SizedBox(height: 30),
      Row(
        children: const [
          Icon(
            Icons.delivery_dining,
            size: 20,
            color: Color.fromARGB(255, 3, 59, 107),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Delivery costs",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(255, 3, 59, 107),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color.fromARGB(255, 255, 245, 240),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Order from:"),
              Text("CHF 35.00"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Delivery costs:"),
              Text("FREE"),
            ],
          ),
        ]),
      )
    ],
  );
}
