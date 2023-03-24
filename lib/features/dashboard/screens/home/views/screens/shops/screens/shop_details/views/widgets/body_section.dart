import 'package:flutter/material.dart';

import '../../models/shop_model.dart';
import 'category_card_view.dart';

class BodySection extends StatefulWidget {
  const BodySection({
    Key? key,
    required this.category,
  }) : super(key: key);

  final SPcategories category;

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categorySection(context, widget.category.name!),
          // itemsOfCategory(context, widget.category),
        ],
      ),
    );
  }

  Widget categorySection(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        CategoryCardView(title: title),
        const SizedBox(height: 16),
      ],
    );
  }
}