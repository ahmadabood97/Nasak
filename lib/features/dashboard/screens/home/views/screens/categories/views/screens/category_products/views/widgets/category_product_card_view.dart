import 'package:flutter/material.dart';
import 'package:nasak/core/utils/hex_colors.dart';
import '../../../../../../../../../../../../core/utils/assets_manager.dart';
import '../../models/category_details.dart';

Widget categoryProductCardView(CatProducts catProducts, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5))),
                child: Icon(
                  Icons.add,
                  color: HexColor("145c96"),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                ImageAssets.resturantIcon,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              catProducts.name!,
              style: const TextStyle(
                  fontSize: 12,
                  height: 1,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              catProducts.shortDescription!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );
}
