import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget reviewCardView() {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 245, 240),
        borderRadius: BorderRadius.all(Radius.circular(3))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fabian Bleesz",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Sunday, 15 January"),
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
              initialRating: 3,
              itemSize: 20,
              minRating: 1,
              unratedColor: Colors.grey.withOpacity(0.5),
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.orange),
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
              initialRating: 3,
              itemSize: 20,
              minRating: 1,
              unratedColor: Colors.grey.withOpacity(0.5),
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.orange),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
          style: TextStyle(height: 2),
        )
      ],
    ),
  );
}
