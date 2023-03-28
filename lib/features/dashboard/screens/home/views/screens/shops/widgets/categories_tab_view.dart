import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../models/app_services_model.dart';

Widget categoriesTabView(
        BuildContext context,
        List<ServiceCategories> categoriesShopsList,
        String serviceId,
        String deliveryLocationsId) =>
    SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              categoriesShopsList.length,
              (index) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!Provider.of<HomeProvider>(context, listen: false)
                              .isLoading) {
                            Provider.of<HomeProvider>(context, listen: false)
                                .setTabSelected(
                                    index,
                                    categoriesShopsList[index].id!,
                                    serviceId,
                                    deliveryLocationsId);
                          }
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Provider.of<HomeProvider>(context,
                                                listen: true)
                                            .tabSelected ==
                                        index
                                    ? Colors.orange
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: Text(
                              categoriesShopsList[index].name!,
                              style: TextStyle(
                                  color: Provider.of<HomeProvider>(context,
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
