import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget orderCardView(BuildContext context) {
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
                          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/restaurant-logo-design-template-c2119aff1d9a65251729cbc3510375e7_screen.jpg?ts=1629395591',
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
                            const Text(
                              "Konig Grill & Burger Haus",
                              maxLines: 1,
                              style: TextStyle(
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
                              "Augustinusstrase 17",
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
                            const Text(
                              "17,70 \$",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
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
