import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../core/utils/constants.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: Constants.getHeight(context) * 0.2,
      child: Center(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.emoji_emotions,
              color: Colors.orange,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Provider.of<LoginProvider>(context, listen: true).loginData ==
                        null
                    ? "Hi there!"
                    : "${Provider.of<LoginProvider>(context, listen: true).loginData!.firstName!} ${Provider.of<LoginProvider>(context, listen: true).loginData!.lastName!}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("View personal information",
                  style: TextStyle(color: Colors.white, fontSize: 15))
            ],
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      )),
    );
  }
}
