import 'package:flutter/material.dart';

import '../../models/shop_model.dart';

Widget extraCardView(List<ProductDetails> productDetails) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        productDetails[0].groupName!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Color.fromARGB(255, 35, 109, 170),
        ),
      ),
      ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: productDetails.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              productDetails[index].optionName!,
              style: const TextStyle(color: Colors.black87, fontSize: 12),
            ),
            secondary: const Icon(
              Icons.info_outline,
              size: 20,
            ),
            value: false,
            onChanged: (newValue) {},
          );
        },
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
