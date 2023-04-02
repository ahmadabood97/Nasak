import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/services_section.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../countries/controllers/provider/countries_provider.dart';
import '../../../../../../controllers/provider/home_provider.dart';
import '../../../../../../models/home_model.dart';

class ServiceCardView extends StatefulWidget {
  final int index;
  const ServiceCardView({super.key, required this.index});

  @override
  State<ServiceCardView> createState() => _ServiceCardViewState();
}

class _ServiceCardViewState extends State<ServiceCardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DeliveryLocations deliveryLocations =
            await Provider.of<CountriesProvider>(context, listen: false)
                .getLocationData();
        if (!mounted) return;
        if (Provider.of<HomeProvider>(context, listen: false)
            .home!
            .result!
            .appServices![widget.index]
            .showCategories!) {
          if (!mounted) return;
          Navigator.pushNamed(context, Routes.categoriesRoute,
              arguments: ParamsServiceSection(
                  deliveryLocations: deliveryLocations,
                  serviceId: Provider.of<HomeProvider>(context, listen: false)
                      .home!
                      .result!
                      .appServices![widget.index]
                      .id!));
        } else {
          Navigator.pushNamed(context, Routes.dashboardShopRoute,
              arguments: ParamsServiceSection(
                  deliveryLocations: deliveryLocations,
                  serviceId: Provider.of<HomeProvider>(context, listen: false)
                      .home!
                      .result!
                      .appServices![widget.index]
                      .id!));
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
                    .appServices![widget.index]
                    .displayname!,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
