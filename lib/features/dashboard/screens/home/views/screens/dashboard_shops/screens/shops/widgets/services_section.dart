import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/models/home_model.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/services_card_view.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/provider/home_provider.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    children: List.generate(
                        Provider.of<HomeProvider>(context, listen: false)
                            .home!
                            .result!
                            .appServices!
                            .length,
                        (index) => index % 2 == 0
                            ? ServiceCardView(index: index)
                            : const SizedBox()),
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: List.generate(
                        Provider.of<HomeProvider>(context, listen: false)
                            .home!
                            .result!
                            .appServices!
                            .length,
                        (index) => index % 2 == 1
                            ? ServiceCardView(index: index)
                            : const SizedBox()),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ParamsServiceSection {
  DeliveryLocations? deliveryLocations;
  String? serviceId;
  ParamsServiceSection(
      {required this.deliveryLocations, required this.serviceId});
}
