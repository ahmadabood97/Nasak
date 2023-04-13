import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../../../../../../core/utils/hex_colors.dart';
import '../../../dashboard_shops/screens/shops/widgets/custom_button.dart';

Widget doHaveAccount(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          const Expanded(
              flex: 2,
              child: Text(
                "Do you have an account?",
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 48, 88),
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.signinRoute,
                    arguments: 'checkout'),
                child: customButton(
                    context, "Sign in", HexColor('3359ba'), Colors.white),
              )),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Divider(
        thickness: 2,
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
