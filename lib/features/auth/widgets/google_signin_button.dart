import 'package:flutter/material.dart';

import '../../../core/utils/assets_manager.dart';

class GoogleSignin extends StatelessWidget {
  const GoogleSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(3))),
        height: 50,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.googleIcon,
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "Sign in with Google",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
