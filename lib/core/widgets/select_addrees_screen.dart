import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import 'package:provider/provider.dart';

import '../../features/dashboard/screens/home/controllers/provider/home_provider.dart';

class SelectAddressScreen extends StatefulWidget {
  final String serviceId;
  const SelectAddressScreen({super.key, required this.serviceId});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  void initState() {
    for (var element in Provider.of<HomeProvider>(context, listen: false)
        .home!
        .result!
        .deliveryLocations!) {
      Provider.of<CountriesProvider>(context, listen: false)
          .locationDropdownList
          .add(element.deliveryRegionName!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            "Select Address",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        separatorBuilder: (context, index) => Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        itemCount: Provider.of<CountriesProvider>(context, listen: false)
            .locationDropdownList
            .length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              for (var element
                  in Provider.of<HomeProvider>(context, listen: false)
                      .home!
                      .result!
                      .deliveryLocations!) {
                if (element.deliveryRegionName ==
                    Provider.of<CountriesProvider>(context, listen: false)
                        .locationDropdownList[index]) {
                  Provider.of<CountriesProvider>(context, listen: false)
                      .setLocationsSelectedValue(element);
                  Provider.of<CountriesProvider>(context, listen: false)
                      .saveLocation(element);

                  Provider.of<HomeProvider>(context, listen: false).clear();

                  Provider.of<HomeProvider>(context, listen: false).getShops(
                      widget.serviceId, element.id!,
                      showLoading: true);
                  Navigator.pop(context);
                }
              }
            },
            child: Text(Provider.of<CountriesProvider>(context, listen: false)
                .locationDropdownList[index]),
          );
        },
      ),
    );
  }
}
