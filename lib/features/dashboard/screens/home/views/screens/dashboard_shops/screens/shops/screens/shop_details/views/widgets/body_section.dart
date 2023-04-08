import 'package:flutter/material.dart';

import '../../../../../../../../../models/app_services_model.dart';
import '../../models/shop_model.dart';
import 'items_shop_card_view.dart';

class BodySection extends StatefulWidget {
  final SpProducts product;
  final ServiceProviders serviceProvider;
  const BodySection(
      {Key? key, required this.product, required this.serviceProvider})
      : super(key: key);

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemsShopCardView(
            product: widget.product,
            serviceProvider: widget.serviceProvider,
          ),
        ],
      ),
    );
  }
}
