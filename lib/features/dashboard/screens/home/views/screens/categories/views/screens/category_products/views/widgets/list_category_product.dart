import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/categories/views/screens/category_products/views/widgets/no_more_data.dart';
import '../../../../../../../../../../../../core/utils/constants.dart';
import '../../models/category_details.dart';
import 'category_product_card_view.dart';

Widget listCategorProduct(BuildContext context, ScrollController controller,
    List<CatProducts> categorProducts) {
  return categorProducts.isEmpty
      ? Column(
          children: [
            SizedBox(
              height: Constants.getHeight(context) * 0.3,
            ),
            const Center(
              child: Text(
                "This category doesn't have any product",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.05),
          itemCount: categorProducts.length + 1,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return index < categorProducts.length
                ? categoryProductCardView(categorProducts[index], context)
                : noMoreData(context);
          },
        );
}
