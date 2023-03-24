import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../controllers/provider/home_provider.dart';

Widget categoryCardView(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () async {
        Navigator.pushNamed(context, Routes.categoryProductRoute);
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
                    .categoriesList[index]
                    .name!,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
