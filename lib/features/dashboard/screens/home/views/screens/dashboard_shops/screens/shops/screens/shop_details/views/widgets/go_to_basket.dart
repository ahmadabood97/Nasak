import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../../../../config/routes/app_routes.dart';
import 'bag_icon.dart';

Widget goToBasket(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.basketRoute),
      child: Container(
        width: double.infinity,
        height: 50,
        color: const Color.fromARGB(255, 3, 59, 107),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: bagIcon(
                  Colors.orange,
                  Provider.of<HomeProvider>(context, listen: true)
                      .itemInCart
                      .toString()),
            ),
            const Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "Go to basket (117.50 \$)",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    ),
  );
}
