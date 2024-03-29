import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../../models/app_services_model.dart';
import '../../../../models/shop_model.dart';

Widget basketItemCardView(SpProducts product, ServiceProviders serviceProviders,
    BuildContext context) {
  return Slidable(
    endActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          backgroundColor: Colors.red,
          onPressed: (context) {
            for (int i = 0; i < serviceProviders.cart.length; i++) {
              if (serviceProviders.cart[i].id == product.id &&
                  serviceProviders.cart[i].priceWithExtra ==
                      product.priceWithExtra &&
                  serviceProviders.cart[i].productDetails ==
                      product.productDetails) {
                Provider.of<HomeProvider>(context, listen: false)
                    .removeItemFromCart(
                        serviceProviders, serviceProviders.cart[i]);
                break;
              }
            }
          },
          icon: Icons.delete,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          product.quantityInCart.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          product.name.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${product.priceWithExtra ?? product.price} ${Provider.of<HomeProvider>(context, listen: true).currency!.symbol!}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          Provider.of<HomeProvider>(context, listen: false)
                              .getExtras(product),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  )),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Add note",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 35, 109, 170)),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (product.quantityInCart > 1) {
                          Provider.of<HomeProvider>(context, listen: false)
                              .decreaseItemQuantityInCart(
                                  product, serviceProviders);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.7))),
                        width: 35,
                        height: 30,
                        child: const Center(
                          child: Icon(Icons.remove,
                              color: Color.fromARGB(255, 35, 109, 170)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<HomeProvider>(context, listen: false)
                            .increaseItemQuantityInCart(
                                product, serviceProviders);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3)),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.7))),
                          width: 35,
                          height: 30,
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 35, 109, 170),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 0,
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    ),
  );
}
