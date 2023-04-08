import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../../../../controllers/provider/home_provider.dart';
import '../../../../../../models/app_services_model.dart';
import '../screens/shop_details/controllers/provider/shop_provider.dart';
import 'icon_with_text.dart';

Widget shopItemCard(ServiceProviders serviceProviders, BuildContext context) =>
    Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {
          Provider.of<ShopProvider>(context, listen: false).clear();
          Provider.of<HomeProvider>(context, listen: false)
              .getCart(serviceProviders);
          Provider.of<ShopProvider>(context, listen: false).getShopDetails(
              serviceProviders.id!,
              '',
              Provider.of<LoginProvider>(context, listen: false).loginData !=
                      null
                  ? Provider.of<LoginProvider>(context, listen: false)
                      .loginData!
                      .authToken!
                  : "", showShopDetails: () {
            Navigator.pushNamed(context, Routes.shopDetailsRoute,
                arguments: serviceProviders);
          }, closeLoading: () {
            Navigator.pop(context);
          }, context: context, showLoading: true);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl:
                    'https://assets.bonappetit.com/photos/57aceacc1b3340441497532d/master/pass/double-rl-ranch-burger.jpg',
                height: Constants.getHeight(context) * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 40,
                bottom: 60,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/736x/33/b8/69/33b869f90619e81763dbf1fccc896d8d--lion-logo-modern-logo.jpg'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.5))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              serviceProviders.name.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  serviceProviders.approvedRatingSum.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(${serviceProviders.approvedTotalReviews.toString()})",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          iconWithText("10-20 min", Icons.timer_outlined),
                          iconWithText("1.5 \$", Icons.badge_outlined),
                          iconWithText(
                              "Min. 10.00 ", Icons.delivery_dining_outlined)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
