import 'package:flutter/material.dart';

Widget bagIcon(Color color, String numItems) {
  return Stack(
    children: [
      const Center(
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      Center(
        child: Align(
          heightFactor: 2,
          widthFactor: 2,
          alignment: Alignment.bottomRight,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: color,
            ),
            child: Center(
                child: Text(
              textAlign: TextAlign.center,
              numItems,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    ],
  );
}
