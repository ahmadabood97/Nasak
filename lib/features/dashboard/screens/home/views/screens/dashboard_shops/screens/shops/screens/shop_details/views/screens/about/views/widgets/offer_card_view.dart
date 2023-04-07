import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/about_model.dart';

Widget offerCardView(BuildContext context, SpOffers item) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
          height: 110,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              border: Border.all(color: Colors.grey.withOpacity(0.7))),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border(
                        right: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://img.freepik.com/free-vector/abstract-colorful-sales-banner_23-2148355131.jpg',
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: SizedBox(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.specialOfferTitle!,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "23 October 2022 at 21:03",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.specialOfferDesc!,
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${item.totalSpecialOfferPrice!} \$",
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "25,70 \$",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          )));
}
