import 'package:flutter/material.dart';
import 'package:nasak/core/utils/assets_manager.dart';
import 'package:nasak/features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import 'package:nasak/features/dashboard/screens/home/models/home_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../config/routes/app_routes.dart';
import '../../../../controllers/provider/home_provider.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  @override
  Widget build(BuildContext context) {
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
              onTap: () async {
                DeliveryLocations deliveryLocations =
                    await Provider.of<CountriesProvider>(context, listen: false)
                        .getLocationData();

                if (!mounted) return;
                Provider.of<HomeProvider>(context, listen: false)
                    .getAppServices(
                        serviceId:
                            Provider.of<HomeProvider>(context, listen: false)
                                .home!
                                .result!
                                .appServices![index]
                                .id!,
                        locationId: deliveryLocations.id!);

                if (Provider.of<HomeProvider>(context, listen: false)
                    .home!
                    .result!
                    .appServices![index]
                    .showCategories!) {
                } else {
                  if (!mounted) return;
                  Navigator.pushNamed(context, Routes.shopRoute,
                      arguments: deliveryLocations.deliveryRegionName);
                }
              },
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
}
