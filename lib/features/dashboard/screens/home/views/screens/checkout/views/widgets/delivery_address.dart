import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../core/widgets/text_field_custom.dart';

Widget deliveryAddress() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Delivery address',
        style: TextStyle(
            color: Color.fromARGB(255, 3, 59, 107),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 25,
      ),
      TextFieldCustom(
        title: "Street and house number",
        type: 'name',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "Postcode",
        type: 'num',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "City",
        type: 'name',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "Floor (optional)",
        type: 'num',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "Company name (optional)",
        type: 'name',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "Add note for delivery (optional)",
        type: 'note',
      ),
      SizedBox(
        height: 25,
      ),
    ],
  );
}
