import 'package:flutter/material.dart';

import '../../models/order_details_model.dart';
import 'order_again_button.dart';
import 'order_item_card_view.dart';
import 'shop_identity.dart';
import 'total_order.dart';

Widget mainSection(OrderDetailsResponseModel orderDetails) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        shopIdentity(orderDetails),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                orderItemCardView(orderDetails.result!.orderItems![index]),
            separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
            itemCount: orderDetails.result!.orderItems!.length),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            thickness: 2,
          ),
        ),
        totalOrder(orderDetails),
        orderAgainButton(),
        const SizedBox(
          height: 25,
        )
      ],
    ),
  );
}
