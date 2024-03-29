import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget progressIndicator(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: Constants.getHeight(context) * 0.3,
      ),
      const Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      ),
    ],
  );
}
