import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/controllers/provider/about_provider.dart';
import 'package:provider/provider.dart';

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
              deliveryTimes(
                  context,
                  Provider.of<AboutProvider>(context, listen: true)
                      .todayDeliveryPeroid!,
                  Provider.of<AboutProvider>(context, listen: true)
                      .tomorrowDeliveryPeroid!),
              deliveryCosts(),
              paymentOptions(),
              colophon()
            ]),
      ),
    );
  }
}
