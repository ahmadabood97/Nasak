import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/categories/views/screens/category_products/controllers/provider/category_details_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../countries/controllers/provider/countries_provider.dart';
import '../../../../../../countries/models/countries_model.dart';
import '../../../../../models/app_services_model.dart';
import '../../../../../models/home_model.dart';
import '../screens/category_products/views/screens/category_product_screen.dart';

class CategoryCardView extends StatefulWidget {
  final ServiceCategories serviceCategory;
  const CategoryCardView({super.key, required this.serviceCategory});

  @override
  State<CategoryCardView> createState() => _CategoryCardViewState();
}

class _CategoryCardViewState extends State<CategoryCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          Countries country =
              await Provider.of<CountriesProvider>(context, listen: false)
                  .getCountryData();
          if (!mounted) return;

          DeliveryLocations deliveryLocations =
              await Provider.of<CountriesProvider>(context, listen: false)
                  .getLocationData();
          if (!mounted) return;

          Provider.of<CategoryDetailsProvider>(context, listen: false).clear();
          Provider.of<CategoryDetailsProvider>(context, listen: false)
              .getCategoryDetails(widget.serviceCategory.id!,
                  deliveryLocations.id!, country.id!, () {
            Navigator.pushNamed(context, Routes.categoryProductRoute,
                arguments: ParamsCategoryProduct(
                    category: widget.serviceCategory,
                    location: deliveryLocations,
                    country: country));
          });
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
                  widget.serviceCategory.name!,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
