import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nasak/core/utils/constants.dart';

Widget headSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 10),
    color: const Color.fromARGB(255, 3, 59, 107),
    height: Constants.getHeight(context) * 0.2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overall score",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "2.0",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 1,
              height: Constants.getHeight(context) * 0.1,
              color: Colors.grey.withOpacity(0.5),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: 3,
                  itemSize: 20,
                  minRating: 1,
                  unratedColor: Colors.white.withOpacity(0.9),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.orange),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Text(
                      "out of 161 reviews",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      size: 20,
                      Icons.info_outline,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
