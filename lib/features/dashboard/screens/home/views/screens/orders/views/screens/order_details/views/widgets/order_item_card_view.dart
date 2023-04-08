import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/orders/views/screens/order_details/models/order_details_model.dart';

Widget orderItemCardView(OrderItems orderItems) {
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
                orderItems.attrbutesDescStr.toString(),
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
