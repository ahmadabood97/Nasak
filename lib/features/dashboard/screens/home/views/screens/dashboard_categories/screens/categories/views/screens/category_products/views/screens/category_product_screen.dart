import 'package:flutter/material.dart';
import 'package:nasak/core/widgets/circular_progress_indicator.dart';
import 'package:nasak/features/dashboard/screens/countries/models/countries_model.dart';
import 'package:nasak/features/dashboard/screens/home/models/home_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../models/app_services_model.dart';
import '../../controllers/provider/category_details_provider.dart';
import '../widgets/category_tab_view.dart';
import '../widgets/list_category_product.dart';

class CategoryProductScreen extends StatefulWidget {
  final ParamsCategoryProduct params;

  const CategoryProductScreen({super.key, required this.params});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (Provider.of<CategoryDetailsProvider>(context, listen: false)
            .hasMore) {
          Provider.of<CategoryDetailsProvider>(context, listen: false)
              .getCategoryDetails(
                  widget.params.category.id!,
                  widget.params.location.id!,
                  widget.params.country!.currencyId!,
                  () {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: Text(
          widget.params.category.name!,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: ListView(
        controller: controller,
        children: [
          categoriesTabView(
              context,
              Provider.of<CategoryDetailsProvider>(context, listen: true)
                  .subCategoriesList,
              widget.params.location.id!,
              widget.params.country!.currencyId!,
              widget.params.category.id!),
          Provider.of<CategoryDetailsProvider>(context, listen: true).isLoading
              ? progressIndicator(context)
              : listCategorProduct(
                  context,
                  controller,
                  Provider.of<CategoryDetailsProvider>(context, listen: true)
                      .catProductsList),
        ],
      ),
    );
  }
}

class ParamsCategoryProduct {
  Countries? country;
  DeliveryLocations location;
  ServiceCategories category;

  ParamsCategoryProduct(
      {required this.country, required this.category, required this.location});
}
