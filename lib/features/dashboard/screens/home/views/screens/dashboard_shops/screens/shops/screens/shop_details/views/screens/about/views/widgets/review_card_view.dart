import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../../../../../../../../../../core/utils/constants.dart';
import '../../models/about_model.dart';

Widget reviewCardView(SpReviews review) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 245, 240),
        borderRadius: BorderRadius.all(Radius.circular(3))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          review.title.toString(),
          style: TextStyle(
              color: Constants.primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          review.createdOn.toString(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Food",
              style: TextStyle(
                  color: Color.fromARGB(255, 3, 59, 107),
                  fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: review.productRating!.toDouble(),
              itemSize: 20,
              minRating: 1,
              unratedColor: Colors.grey.withOpacity(0.5),
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Constants.primaryColor),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Delivery",
              style: TextStyle(
                  color: Color.fromARGB(255, 3, 59, 107),
                  fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: review.deliveryRating!.toDouble(),
              itemSize: 20,
              minRating: 1,
              unratedColor: Colors.grey.withOpacity(0.5),
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Constants.primaryColor),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          review.reviewText.toString(),
          style: const TextStyle(height: 2),
        )
      ],
    ),
  );
}
