import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/controllers/provider/about_provider.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/models/about_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../../../../../../../core/utils/constants.dart';

Widget deliveryTimes(
    BuildContext context,
    TodayDeliveryPeroid todayDeliveryPeroid,
    TodayDeliveryPeroid tomorrowDeliveryPeroid) {
  return Column(
    children: [
      Row(
        children: const [
          Icon(
            Icons.timer,
            size: 20,
            color: Color.fromARGB(255, 3, 59, 107),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Delivery times",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(255, 3, 59, 107),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Provider.of<AboutProvider>(context, listen: true).isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ),
            )
          : Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Color.fromARGB(255, 255, 245, 240),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Today:"),
                        Text(
                            "${todayDeliveryPeroid.startHour} - ${todayDeliveryPeroid.endHour}"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tomorrow:"),
                        Text(
                            "${tomorrowDeliveryPeroid.startHour} - ${tomorrowDeliveryPeroid.endHour}"),
                      ],
                    ),
                  ]),
            )
    ],
  );
}
