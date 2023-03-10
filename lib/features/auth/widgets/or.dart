import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "or",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
