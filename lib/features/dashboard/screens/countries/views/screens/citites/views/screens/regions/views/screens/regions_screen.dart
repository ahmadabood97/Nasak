import 'package:flutter/material.dart';
import '../../../../../models/cities_model.dart';

import '../../../../../../../widgets/country_city_region_card_view.dart';

class RegionsScreen extends StatelessWidget {
  final Cities city;
  const RegionsScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Reigons',
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
                itemCount: city.regions!.length,
                itemBuilder: (context, index) =>
                    countryCityRegionCardView(city.regions![index].name!),
              ),
            ],
          ),
        ));
  }
}
