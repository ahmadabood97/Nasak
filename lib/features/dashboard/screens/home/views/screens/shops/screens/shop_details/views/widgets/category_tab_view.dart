import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/provider/shop_provider.dart';
import '../../models/shop_model.dart';

Widget categoryTabView(
    List<SPcategories> categoriesList, String shopId, BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(10),
    scrollDirection: Axis.horizontal,
    child: Row(
        children: List.generate(
            categoriesList.length,
            (index) => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!Provider.of<ShopProvider>(context, listen: false)
                            .isLoading) {
                          Provider.of<ShopProvider>(context, listen: false)
                              .setTabSelected(index, shopId,
                                  categoriesList[index].id!, context, () {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Provider.of<ShopProvider>(context,
                                              listen: true)
                                          .tabSelected ==
                                      index
                                  ? Colors.orange
                                  : Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: Text(
                            categoriesList[index].name!,
                            style: TextStyle(
                                color: Provider.of<ShopProvider>(context,
                                                listen: true)
                                            .tabSelected ==
                                        index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ))),
  );
}
