import 'package:flutter/material.dart';

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
              children: const [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text(
                  "Please wait...",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        );
      });
}
