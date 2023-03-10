import 'package:flutter/material.dart';

import '../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../models/countries_model.dart';
import '../../../../widgets/country_city_region_card_view.dart';

class CitiesScreen extends StatelessWidget {
  final Countries country;
  const CitiesScreen({
    required this.country,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Cities',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: country.cities!.length,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      if (country.cities![index].regions!.isNotEmpty) {
                        Navigator.pushNamed(context, Routes.regionsRoute,
                            arguments: country.cities![index]);
                      } else {
                        // Provider.of<CountriesProvider>(context, listen: false)
                        //     .saveLocation(country);
                      }
                    },
                    child: countryCityRegionCardView(
                        country.cities![index].name!.toString())),
              ),
            ],
          ),
        ));
  }
}
