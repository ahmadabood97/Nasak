import 'package:flutter/material.dart';

import '../../../../../../../../../../../auth/widgets/text_field_custom.dart';

Widget personalDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Personal details',
        style: TextStyle(
            color: Color.fromARGB(255, 3, 59, 107),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 25,
      ),
      TextFieldCustom(
        title: "First and last name",
        type: 'name',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "Email address",
        type: 'email',
      ),
      SizedBox(
        height: 15,
      ),
      TextFieldCustom(
        title: "Phone number",
        type: 'phone',
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
