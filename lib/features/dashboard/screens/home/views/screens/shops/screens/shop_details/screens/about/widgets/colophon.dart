import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../../../../../../core/utils/hex_colors.dart';

Widget colophon() {
  return Column(
    children: [
      const SizedBox(height: 30),
      Row(
        children: const [
          Icon(
            Icons.business,
            size: 20,
            color: Color.fromARGB(255, 3, 59, 107),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Colophon",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(255, 3, 59, 107),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color.fromARGB(255, 255, 245, 240),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Croen of India Restaurant Zurichstrasse 105 8123 Ebmatingen",
            style: TextStyle(height: 1.5, fontSize: 14),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(
            children: [
              const TextSpan(
                text: 'We are a professional trader. ',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              TextSpan(
                text: 'Learn more',
                style: TextStyle(
                    color: HexColor('3359ba'),
                    decoration: TextDecoration.underline,
                    fontSize: 14),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // ignore: deprecated_member_use
                    launch(
                        'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                  },
              ),
              const TextSpan(
                text:
                    ' about how we and Takeaway.com split responsibilities to our consumer',
                style:
                    TextStyle(color: Colors.black, fontSize: 14, height: 1.5),
              ),
            ],
          )),
        ]),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}
