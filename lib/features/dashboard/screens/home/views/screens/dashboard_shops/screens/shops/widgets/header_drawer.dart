import 'package:flutter/material.dart';

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
            children: const [
              Text(
                "Hi there!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text("View personal information",
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
