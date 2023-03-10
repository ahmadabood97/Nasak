import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/hex_colors.dart';
import '../../../../../../core/widgets/text_field_custom.dart';
import '../../../../widgets/facebook_signin_button.dart';
import '../../../../widgets/google_signin_button.dart';
import '../../../../widgets/or.dart';
import '../widgets/signin_button.dart';

class SigninScreen extends StatefulWidget {
  final String screenFrom;
  const SigninScreen({super.key, required this.screenFrom});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
            onTap: () => widget.screenFrom == 'checkout'
                ? Navigator.pop(context)
                : Navigator.pushReplacementNamed(
                    context, Routes.dashboardRoute),
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          )),
      body: Form(
        key: loginFormKey,
        child: ListView(children: [
          const GoogleSignin(),
          const FaceBookSignin(),
          const Or(),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 18, right: 18),
            child: TextFieldCustom(
              title: "Phone",
              type: 'phone_login',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 18, right: 18),
            child: TextFieldCustom(
              title: "Password",
              type: 'password_login',
            ),
          ),
          Provider.of<LoginProvider>(context, listen: true).isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SignInButton(
                  screenFrom: widget.screenFrom, loginFormKey: loginFormKey),
          widget.screenFrom != "signup" && widget.screenFrom != "checkout"
              ? Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.signupRoute,
                            arguments: 'signin');
                      },
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
      ),
    );
  }
}
