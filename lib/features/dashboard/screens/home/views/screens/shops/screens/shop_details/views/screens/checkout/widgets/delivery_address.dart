import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../core/widgets/text_field_custom.dart';

Widget deliveryAddress() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Delivery address',
        style: TextStyle(
            color: Color.fromARGB(255, 3, 59, 107),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 25,
      ),
      const TextFieldCustom(
        title: "Street and house number",
        type: 'name',
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "Postcode",
        type: 'num',
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "City",
        type: 'name',
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "Floor (optional)",
        type: 'num',
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "Company name (optional)",
        type: 'name',
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "Add note for delivery (optional)",
        type: 'note',
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Save this note for your next order',
            style: TextStyle(fontSize: 12),
          ),
          Switch(
              activeColor: Colors.orange, value: true, onChanged: (value) {}),
        ],
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
