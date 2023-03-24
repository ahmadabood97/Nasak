import 'package:flutter/material.dart';

import '../../example_data.dart';
import 'items_shop_card_view.dart';

Widget itemsOfCategory(BuildContext context, Category category) {
  return Column(
    children: List.generate(
      category.foods.length,
      (index) {
        bool isLastIndex = index == category.foods.length - 1;
        return Column(
          children: [
            ItemsShopCardView(
              isLastIndex: isLastIndex,
            ),
            const SizedBox(
              height: 15,
            )
          ],
        );
      },
    ),
  );
}
