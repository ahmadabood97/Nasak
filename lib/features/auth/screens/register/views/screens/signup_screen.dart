import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/hex_colors.dart';
import '../../../../widgets/facebook_signin_button.dart';
import '../../../../widgets/google_signin_button.dart';
import '../../../../widgets/or.dart';
import '../../../../widgets/text_field_custom.dart';
import '../widgets/create_account_button.dart';

class SignUpScreen extends StatefulWidget {
  final String screenFrom;
  const SignUpScreen({super.key, required this.screenFrom});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Create account',
            style:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
          ),
          leading: InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.dashboardRoute),
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
            title: "Name",
            type: 'name',
          ),
        ),
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
            type: 'password_signup',
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 18, right: 18),
          child: TextFieldCustom(
            title: "Confirm password",
            type: 'condirm_password',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CheckboxListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          activeColor: Colors.orange,
          side: const BorderSide(width: 1, color: Colors.grey),
          title: const Text(
            "Yes, I want to receive discounts, loyalty offers, and other updates.",
            style: TextStyle(fontSize: 12),
          ),
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const CreateAccountButton(),
        Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 20, left: 15, right: 15),
          child: Center(
            child: RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                  text: 'By clicking on "Create account", you agree to our ',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                TextSpan(
                  text: 'terms of use,',
                  style: TextStyle(
                      color: HexColor('3359ba'),
                      decoration: TextDecoration.underline,
                      fontSize: 12),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // ignore: deprecated_member_use
                      launch(
                          'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                    },
                ),
                const TextSpan(
                  text: ' ',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                TextSpan(
                  text: 'terms of use of point collection ',
                  style: TextStyle(
                    fontSize: 12,
                    color: HexColor('3359ba'),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // ignore: deprecated_member_use
                      launch(
                          'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                    },
                ),
                const TextSpan(
                  text: 'and ',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                TextSpan(
                  text: 'privacy statement.',
                  style: TextStyle(
                    fontSize: 12,
                    color: HexColor('3359ba'),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // ignore: deprecated_member_use
                      launch(
                          'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                    },
                ),
              ],
            )),
          ),
        ),
        widget.screenFrom != 'signin'
            ? Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                child: Center(
                  child: InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.signinRoute,
                        arguments: 'signup'),
                    child: Text("I already have an account",
                        style: TextStyle(
                            color: HexColor("e57744"),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            : const SizedBox()
      ]),
    );
  }
}
