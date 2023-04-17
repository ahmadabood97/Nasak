import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../core/widgets/text_field_custom.dart';

Widget personalDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Personal details',
        style: TextStyle(
            color: Color.fromARGB(255, 3, 59, 107),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 25,
      ),
      Row(
        children: const [
          Expanded(
              flex: 8,
              child: TextFieldCustom(
                  title: "First Name", type: "first_name_checkout")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 8,
              child: TextFieldCustom(
                  title: "Last Name", type: "last_name_checkout")),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "Email address",
        type: 'email_checkout',
      ),
      const SizedBox(
        height: 15,
      ),
      const TextFieldCustom(
        title: "Phone number",
        type: 'phone_checkout',
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}
