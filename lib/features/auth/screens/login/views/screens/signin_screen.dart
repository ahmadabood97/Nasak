import 'package:flutter/material.dart';
import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/hex_colors.dart';
import '../../../../widgets/facebook_signin_button.dart';
import '../../../../widgets/google_signin_button.dart';
import '../../../../widgets/or.dart';
import '../../../../widgets/text_field_custom.dart';
import '../widgets/signin_button.dart';

class SigninScreen extends StatelessWidget {
  final String screenFrom;
  const SigninScreen({super.key, required this.screenFrom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Sign in',
            style:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => screenFrom == 'checkout'
                ? Navigator.pop(context)
                : Navigator.pushReplacementNamed(
                    context, Routes.dashboardRoute),
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          )),
      body: ListView(children: [
        const GoogleSignin(),
        const FaceBookSignin(),
        const Or(),
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 18, right: 18),
          child: TextFieldCustom(
            title: "Email address or username",
            type: 'email',
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 18, right: 18),
          child: TextFieldCustom(
            title: "Password",
            type: 'password',
          ),
        ),
        SignInButton(screenFrom: screenFrom),
        screenFrom != "signup" && screenFrom != "checkout"
            ? Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.signupRoute,
                        arguments: 'signin'),
                    child: Text("Create account",
                        style: TextStyle(
                            color: HexColor("e57744"),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
