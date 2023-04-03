import 'package:flutter/material.dart';

import '../widgets/address_details.dart';
import '../widgets/main_section.dart';
import '../widgets/need_help.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 248),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Order details',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: ListView(
        children: [
          mainSection(),
          const SizedBox(
            height: 15,
          ),
          addressDetails(),
          const SizedBox(
            height: 15,
          ),
          needHelp(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
