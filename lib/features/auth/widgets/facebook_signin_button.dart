import 'package:flutter/material.dart';

import '../../../core/utils/hex_colors.dart';

class FaceBookSignin extends StatelessWidget {
  const FaceBookSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('3359ba'),
            borderRadius: const BorderRadius.all(Radius.circular(3))),
        height: 50,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.facebook,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Sign in with FaceBook",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
