import 'package:flutter/material.dart';
import 'package:nasak/core/utils/assets_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../config/routes/app_routes.dart';
import '../../../../controllers/provider/home_provider.dart';

Widget servicesSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(3)),
    ),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.4),
      itemCount: Provider.of<HomeProvider>(context, listen: false)
          .home!
          .result!
          .appServices!
          .length,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.shopRoute),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        ImageAssets.resturantIcon,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      Provider.of<HomeProvider>(context, listen: false)
                          .home!
                          .result!
                          .appServices![index]
                          .displayname!,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
