import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../../../../../core/widgets/no_more_data.dart';
import '../../controllers/provider/category_details_provider.dart';
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
      : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: List.generate(
                          categorProducts.length + 1,
                          (index) => index % 2 == 0
                              ? index < categorProducts.length
                                  ? categoryProductCardView(
                                      categorProducts[index], context)
                                  : noMoreData(
                                      context,
                                      Provider.of<CategoryDetailsProvider>(
                                              context,
                                              listen: true)
                                          .hasMore)
                              : const SizedBox()),
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: List.generate(
                          categorProducts.length + 1,
                          (index) => index % 2 == 1
                              ? index < categorProducts.length
                                  ? categoryProductCardView(
                                      categorProducts[index], context)
                                  : noMoreData(
                                      context,
                                      Provider.of<CategoryDetailsProvider>(
                                              context,
                                              listen: true)
                                          .hasMore)
                              : const SizedBox()),
                    )),
              ],
            ),
          ),
        );
}
