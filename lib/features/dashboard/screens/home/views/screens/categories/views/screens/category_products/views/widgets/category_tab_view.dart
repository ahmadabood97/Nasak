import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/provider/category_details_provider.dart';

Widget categoriesTabView(
        BuildContext context, String locationId, String currencyId) =>
    SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              Provider.of<CategoryDetailsProvider>(context, listen: true)
                  .subCategoriesList
                  .length,
              (index) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!Provider.of<CategoryDetailsProvider>(context,
                                  listen: false)
                              .isLoading) {
                            Provider.of<CategoryDetailsProvider>(context,
                                    listen: false)
                                .setTabSelected(
                                    index,
                                    Provider.of<CategoryDetailsProvider>(
                                            context,
                                            listen: false)
                                        .subCategoriesList[index]
                                        .id!,
                                    locationId,
                                    currencyId);
                          }
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Provider.of<CategoryDetailsProvider>(
                                                context,
                                                listen: true)
                                            .tabSelected ==
                                        index
                                    ? Colors.orange
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: Text(
                              Provider.of<CategoryDetailsProvider>(context,
                                      listen: true)
                                  .subCategoriesList[index]
                                  .name!,
                              style: TextStyle(
                                  color: Provider.of<CategoryDetailsProvider>(
                                                  context,
                                                  listen: true)
                                              .tabSelected ==
                                          index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ))),
    );
