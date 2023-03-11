import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/address_model.dart';

Widget addressCardView(BuildContext context, Addersses address) {
  return Slidable(
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
                  Text(
                    address.addressName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    maxLines: 1,
                    address.userAddress!,
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
                    address.addressExtraDesc!,
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
                    address.phonenumber!,
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
  );
}
