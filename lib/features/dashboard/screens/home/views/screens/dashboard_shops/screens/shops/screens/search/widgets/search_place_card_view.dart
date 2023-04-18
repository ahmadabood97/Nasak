import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../core/utils/constants.dart';
import '../../../widgets/icon_with_text.dart';

Widget searchPlaceCardView(BuildContext context) {
  return Container(
    height: Constants.getHeight(context) * 0.15,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        color: Colors.white),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://logos-world.net/wp-content/uploads/2020/05/McDonalds-Logo-2003.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "Konig Grill & Burger Haus",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Constants.primaryColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "4.3",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(15)",
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
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Doner, Burgers, Iranian Doner",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      iconWithText(
                                          "10-20 min", Icons.timer_outlined),
                                      iconWithText(
                                          "1.5 \$", Icons.badge_outlined),
                                      iconWithText("Min. 10.00 ",
                                          Icons.delivery_dining_outlined),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
              ],
            )),
      ],
    ),
  );
}
