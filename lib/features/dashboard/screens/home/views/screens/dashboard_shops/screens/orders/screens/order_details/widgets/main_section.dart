import 'package:flutter/material.dart';

import 'order_again_button.dart';
import 'order_item_card_view.dart';
import 'shop_identity.dart';
import 'total_order.dart';

Widget mainSection() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        shopIdentity(),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => orderItemCardView(),
            separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
            itemCount: 3),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            thickness: 2,
          ),
        ),
        totalOrder(),
        orderAgainButton(),
        const SizedBox(
          height: 25,
        )
      ],
    ),
  );
}
