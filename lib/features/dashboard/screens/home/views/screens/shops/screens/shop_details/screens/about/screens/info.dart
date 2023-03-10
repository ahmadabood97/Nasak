import 'package:flutter/material.dart';

import '../widgets/colophon.dart';
import '../widgets/delivery_costs.dart';
import '../widgets/delivery_times.dart';
import '../widgets/payment_options.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
            children: [
              deliveryTimes(),
              deliveryCosts(),
              paymentOptions(),
              colophon()
            ]),
      ),
    );
  }
}
