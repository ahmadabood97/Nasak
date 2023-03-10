import 'package:flutter/material.dart';
import '../../../../../../config/routes/app_routes.dart';
import '../../controllers/provider/countries_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/country_city_region_card_view.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Countries',
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
                itemCount:
                    Provider.of<CountriesProvider>(context, listen: false)
                        .countries!
                        .result!
                        .countries!
                        .length,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      if (Provider.of<CountriesProvider>(context, listen: false)
                          .countries!
                          .result!
                          .countries![index]
                          .cities!
                          .isNotEmpty) {
                        Navigator.pushNamed(context, Routes.citiesRoute,
                            arguments: Provider.of<CountriesProvider>(context,
                                    listen: false)
                                .countries!
                                .result!
                                .countries![index]);
                      } else {
                        // Provider.of<CountriesProvider>(context, listen: false)
                        //     .saveLocation(Provider.of<CountriesProvider>(
                        //             context,
                        //             listen: false)
                        //         .countries!
                        //         .result!
                        //         .countries![index]);
                      }
                    },
                    child: countryCityRegionCardView(
                        Provider.of<CountriesProvider>(context, listen: false)
                            .countries!
                            .result!
                            .countries![index]
                            .name!)),
              ),
            ],
          ),
        ));
  }
}
