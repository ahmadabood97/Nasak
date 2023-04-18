import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/constants.dart';

class SelectAddress extends StatelessWidget {
  final String serviceId;

  const SelectAddress({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
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
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                  context, Routes.selectLocationRoute,
                  arguments: serviceId),
              child: Center(
                child: Text(
                    Provider.of<CountriesProvider>(context, listen: true)
                        .locationSelectedValue
                        .deliveryRegionName!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ),
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
