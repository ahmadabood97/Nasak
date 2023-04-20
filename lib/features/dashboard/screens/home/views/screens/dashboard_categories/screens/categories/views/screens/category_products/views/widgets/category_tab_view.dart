import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../../../../../core/utils/constants.dart';
import '../../controllers/provider/category_details_provider.dart';
import '../../models/category_details.dart';

Widget categoriesTabView(
        BuildContext context,
        List<SubCategories> subCategoriesList,
        String locationId,
        String currencyId,
        String parentId) =>
    SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              subCategoriesList.length,
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
                                    subCategoriesList[index].id!,
                                    locationId,
                                    currencyId,
                                    parentId);
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
                                    ? Constants.primaryColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: Text(
                              subCategoriesList[index].name!,
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
