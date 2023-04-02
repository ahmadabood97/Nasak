import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../core/utils/assets_manager.dart';

Widget paymentOptions() {
  return Column(
    children: [
      const SizedBox(height: 30),
      Row(
        children: const [
          Icon(
            Icons.payment_outlined,
            size: 20,
            color: Color.fromARGB(255, 3, 59, 107),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Payment options",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(255, 3, 59, 107),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color.fromARGB(255, 255, 245, 240),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.7),
          itemCount: 7,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          ImageAssets.paypalIcon,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Paypal",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )
    ],
  );
}
