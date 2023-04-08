import 'package:flutter/material.dart';

import '../../models/order_details_model.dart';

Widget totalOrder(OrderDetailsResponseModel orderDetails) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Total",
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
              "View your receipt",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )
          ],
        ),
        Text(
          "${orderDetails.result!.orderTotal!} ${orderDetails.result!.currencySymbol!}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 2, 45, 82),
          ),
        )
      ],
    ),
  );
}
