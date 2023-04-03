import 'package:flutter/material.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../dashboard_shops/screens/shops/widgets/services_section.dart';
import '../widgets/order_card_view.dart';

class OrdersScreen extends StatelessWidget {
  final ParamsServiceSection params;

  const OrdersScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.orange,
            title: const Text(
              'Orders',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
        body:

            //  screenEmpty(Icons.shopping_bag, "No orders yet",
            //     "You have not placed any orders yet.")
            Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.ordersDetailsRoute),
                    child: orderCardView(context)),
              )
            ],
          ),
        ));
  }
}
