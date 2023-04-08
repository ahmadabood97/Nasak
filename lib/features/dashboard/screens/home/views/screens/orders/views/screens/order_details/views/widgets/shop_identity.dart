import 'package:flutter/material.dart';

import '../../models/order_details_model.dart';

Widget shopIdentity(OrderDetailsResponseModel orderDetails) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderDetails.result!.serviceProviderName!,
              style: const TextStyle(
                  color: Color.fromARGB(255, 2, 45, 82),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Order #${orderDetails.result!.customOrderNumber!}',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            color: Colors.white,
            image: const DecorationImage(
              image: NetworkImage(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/restaurant-logo-design-template-c2119aff1d9a65251729cbc3510375e7_screen.jpg?ts=1629395591'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.circle,
          ),
        )
      ],
    ),
  );
}
