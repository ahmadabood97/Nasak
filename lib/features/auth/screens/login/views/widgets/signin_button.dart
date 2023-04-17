import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/hex_colors.dart';
import '../../controllers/provider/login_provider.dart';

class SignInButton extends StatelessWidget {
  final String screenFrom;
  final GlobalKey<FormState> loginFormKey;

  const SignInButton(
      {super.key, required this.screenFrom, required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: InkWell(
        onTap: () {
          if (loginFormKey.currentState!.validate()) {
            Provider.of<LoginProvider>(context, listen: false).login(
              context: context,
              stopLoading: () {
                Navigator.pop(context);
              },
              moveToDashboard: () {
                Navigator.pop(context);
                if (screenFrom != "checkout") {
                  Navigator.pushReplacementNamed(
                      context, Routes.dashboardRoute);
                } else {
                  Navigator.pop(context);
                }
              },
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: HexColor('3359ba'),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          height: 50,
          width: 200,
          child: const Center(
            child: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
