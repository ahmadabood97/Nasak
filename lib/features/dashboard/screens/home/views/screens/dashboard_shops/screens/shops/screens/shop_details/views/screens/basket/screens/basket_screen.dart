import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../../../../../../config/routes/app_routes.dart';
import '../../../widgets/switch_to_delivery.dart';
import '../widgets/basket_item_card_view.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Basket',
            style:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          )),
      body: Stack(children: [
        ListView(children: [
          switchToDelivery(),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 0,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Provider.of<HomeProvider>(context, listen: true)
                .cartList
                .length,
            itemBuilder: (context, index) {
              return basketItemCardView(
                  Provider.of<HomeProvider>(context, listen: true)
                      .cartList[index]);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "27.50 \$",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      "2.50 \$",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "30.00 \$",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ]),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.checkoutRoute),
            child: Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromARGB(255, 3, 59, 107),
              child: const Center(
                child: Text(
                  "Go to checkout (117.50 \$)",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
