import 'package:flutter/material.dart';

class SelectTypeSearch extends StatefulWidget {
  const SelectTypeSearch({super.key});

  @override
  State<SelectTypeSearch> createState() => SelectTypeSearchState();
}

class SelectTypeSearchState extends State<SelectTypeSearch> {
  String serviceType = 'Places';

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
                        serviceType = 'Places';
                      });
                    },
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          "Places (96)",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: serviceType == "Places"
                                  ? Colors.orange
                                  : Colors.black),
                        ))),
                  ),
                  serviceType == "Places"
                      ? const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: Colors.orange,
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
                        serviceType = 'Items';
                      });
                    },
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          "Items (56)",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: serviceType == "Items"
                                  ? Colors.orange
                                  : Colors.black),
                        ))),
                  ),
                  serviceType == 'Items'
                      ? const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: Colors.orange,
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
