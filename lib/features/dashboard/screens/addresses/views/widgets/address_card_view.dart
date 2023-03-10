import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget addressCardView(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              onPressed: (context) {},
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                border: Border.all(color: Colors.grey.withOpacity(0.7))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Robert Robertson, 1234 NW Bobcat Lane, St. Robert",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        maxLines: 1,
                        "Powell St 125",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        maxLines: 1,
                        "Union Square",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        maxLines: 1,
                        "CA 94108 ",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ));
}
