import 'package:flutter/material.dart';

import '../../../../../../../../../../core/utils/constants.dart';

Widget needHelpSection() {
  return Padding(
    padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      width: double.infinity,
      child: ListTile(
        leading: Icon(
          Icons.info,
          color: Constants.primaryColor,
        ),
        title: const Text("Need help?"),
        trailing: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Color.fromARGB(255, 24, 15, 77),
        ),
      ),
    ),
  );
}
