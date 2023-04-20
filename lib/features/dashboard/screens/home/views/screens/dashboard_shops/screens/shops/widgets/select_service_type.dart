import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../core/utils/constants.dart';

class SelectServiceType extends StatefulWidget {
  const SelectServiceType({super.key});

  @override
  State<SelectServiceType> createState() => _SelectServiceTypeState();
}

class _SelectServiceTypeState extends State<SelectServiceType> {
  String serviceType = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        serviceType = 'Delivery';

                        Provider.of<HomeProvider>(context, listen: false)
                            .setIsPickup(false);
                      });
                    },
                    child: Container(
                        color: const Color.fromARGB(255, 255, 250, 245),
                        child: Center(
                            child: Text(
                          "Delivery",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: serviceType == "Delivery"
                                  ? Constants.primaryColor
                                  : Colors.black),
                        ))),
                  ),
                  serviceType == "Delivery"
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: Constants.primaryColor,
                          ),
                        )
                      : Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        serviceType = 'Pickup';

                        Provider.of<HomeProvider>(context, listen: false)
                            .setIsPickup(true);
                      });
                    },
                    child: Container(
                        color: const Color.fromARGB(255, 255, 250, 245),
                        child: Center(
                            child: Text(
                          "Pickup",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: serviceType == "Pickup"
                                  ? Constants.primaryColor
                                  : Colors.black),
                        ))),
                  ),
                  serviceType == 'Pickup'
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: Constants.primaryColor,
                          ),
                        )
                      : Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
