import 'package:flutter/material.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';

class SelectAddress extends StatelessWidget {
  final String deliveryLocation;
  const SelectAddress({super.key, required this.deliveryLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back))),
          Expanded(
            flex: 6,
            child: Center(
              child: Text(deliveryLocation,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.searchRoute);
                        },
                        child: const Icon(Icons.search)),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.filterRoute);
                        },
                        child: const Icon(Icons.filter_list)),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
