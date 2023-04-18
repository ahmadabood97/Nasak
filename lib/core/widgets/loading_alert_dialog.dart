import 'package:flutter/material.dart';

import '../utils/constants.dart';

loading(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            backgroundColor: Colors.white,
            content: Row(
              children: [
                CircularProgressIndicator(color: Constants.primaryColor),
                const SizedBox(width: 16),
                const Text(
                  "Please wait...",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        );
      });
}
