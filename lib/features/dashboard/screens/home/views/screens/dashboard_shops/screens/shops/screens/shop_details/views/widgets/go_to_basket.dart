import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../../../../core/utils/hex_colors.dart';
import '../../../../../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../models/app_services_model.dart';
import '../../../../../../../checkout/views/screens/delivery_date_time/controllers/provider/delivery_date_time_provider.dart';
import 'bag_icon.dart';

Widget goToBasket(BuildContext context, ServiceProviders serviceProviders) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: InkWell(
      onTap: () {
        if (DateTime.parse(DateTime.now()
                        .toUtc()
                        .add(const Duration(minutes: (180)))
                        .toString())
                    .hour <
                Constants.endHour &&
            DateTime.parse(DateTime.now()
                        .toUtc()
                        .add(const Duration(minutes: (180)))
                        .toString())
                    .hour >=
                Constants.startHour) {
          Provider.of<DeliveryDateTimeProvider>(context, listen: false)
              .setDeliveryDateList(7);

          Provider.of<DeliveryDateTimeProvider>(context, listen: false)
              .setDeliveryTimeList(
                  startHour: Constants.startHour,
                  lastHour: Constants.endHour,
                  interval: 30,
                  perparingTime: 30,
                  offest: 180);
          Navigator.pushNamed(context, Routes.basketRoute,
              arguments: serviceProviders);
        } else {
          showCustomDialog(context, 'Shop is close...');
        }
      },
      child: Container(
        width: double.infinity,
        height: 50,
        color: HexColor('3359ba'),
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
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "Go to basket (${Provider.of<HomeProvider>(context, listen: true).subTotal.toString()} ${Provider.of<HomeProvider>(context, listen: true).currency!.symbol!})",
                  style: const TextStyle(
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
