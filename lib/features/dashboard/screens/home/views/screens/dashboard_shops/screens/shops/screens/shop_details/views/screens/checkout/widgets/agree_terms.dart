import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../../../../../../../../../core/utils/hex_colors.dart';

Widget agreeTerms() {
  return Column(
    children: [
      const SizedBox(
        height: 5,
      ),
      const Divider(
        thickness: 2,
      ),
      const SizedBox(
        height: 5,
      ),
      Center(
        child: RichText(
            text: TextSpan(
          children: [
            const TextSpan(
              text:
                  'By clicking on "ORDER AND PAY", you agree with the contents of the shopping cart, the data you filled out, our ',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            TextSpan(
              text: 'terms of use',
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
              text: ' and ',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            TextSpan(
              text: 'privacy statement',
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
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
