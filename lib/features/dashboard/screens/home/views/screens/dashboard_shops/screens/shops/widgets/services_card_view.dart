import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasak/core/utils/hex_colors.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/services_section.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../config/routes/app_routes.dart';
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
          Navigator.pushNamed(context, Routes.dashboardCategoryRoute,
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
      child: Stack(
        children: [
          SizedBox(
            height: 125,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://www.tastingtable.com/img/gallery/is-it-dangerous-to-use-avocado-oil-for-deep-frying/l-intro-1658707935.jpg',
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor('bb6b62'), shape: BoxShape.circle),
                child: CachedNetworkImage(
                    width: 75,
                    height: 75,
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/1996/1996055.png'),
              )),
        ],
      ),
    );
  }
}
