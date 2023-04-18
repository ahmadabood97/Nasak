import 'package:flutter/material.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/hex_colors.dart';
import 'custom_button.dart';

class AuthSection extends StatefulWidget {
  const AuthSection({super.key});

  @override
  State<AuthSection> createState() => _AuthSectionState();
}

class _AuthSectionState extends State<AuthSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 17, bottom: 7),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                    context, Routes.signinRoute,
                    arguments: 'home'),
                child: customButton(
                  context,
                  "Sign in",
                  HexColor('3359ba'),
                  Colors.white,
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                    context, Routes.signupRoute,
                    arguments: 'home'),
                child: customButton(
                  context,
                  "Create account",
                  Colors.white,
                  const Color.fromARGB(255, 24, 15, 77),
                ),
              )),
        ],
      ),
    );
  }
}
