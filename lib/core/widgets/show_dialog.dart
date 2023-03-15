import 'package:flutter/material.dart';

showCustomDialog(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        );
      });
}
