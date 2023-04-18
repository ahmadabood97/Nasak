import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../home/views/screens/dashboard_shops/screens/shops/widgets/screen_empty.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Constants.primaryColor,
            title: const Text(
              'Inbox',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
        body: screenEmpty(
            Icons.mail, "No inbox yet", "You have not placed any inbox yet."));
  }
}
