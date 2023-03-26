import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/countries/views/widgets/save_button.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/dropdown.dart';
import '../../../home/controllers/provider/home_provider.dart';
import '../../controllers/provider/countries_provider.dart';

class CountriesScreen extends StatefulWidget {
  final String screen;
  const CountriesScreen({super.key, required this.screen});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final GlobalKey<FormState> countryFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<CountriesProvider>(context, listen: false).countryDropdownList =
        [];
    Provider.of<CountriesProvider>(context, listen: false)
        .locationDropdownList = [];

    if (Provider.of<CountriesProvider>(context, listen: false)
            .countries!
            .result !=
        null) {
      for (var element in Provider.of<CountriesProvider>(context, listen: false)
          .countries!
          .result!
          .countries!) {
        Provider.of<CountriesProvider>(context, listen: false)
            .countryDropdownList
            .add(element.name!);
      }
      for (var element in Provider.of<HomeProvider>(context, listen: false)
          .home!
          .result!
          .deliveryLocations!) {
        Provider.of<CountriesProvider>(context, listen: false)
            .locationDropdownList
            .add(element.deliveryRegionName!);
      }
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
            'Countries',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        body: Form(
          key: countryFormKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                child: dropDown(
                    'Select your country',
                    Provider.of<CountriesProvider>(context, listen: true)
                            .countriesValue
                            .name ??
                        '',
                    Provider.of<CountriesProvider>(context, listen: true)
                        .countryDropdownList,
                    'Country',
                    context,
                    "CountriesScreen"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                child: dropDown(
                    'Select your location',
                    Provider.of<CountriesProvider>(context, listen: true)
                            .locationSelectedValue
                            .deliveryRegionName ??
                        '',
                    Provider.of<CountriesProvider>(context, listen: true)
                        .locationDropdownList,
                    'Location',
                    context,
                    "CountriesScreen"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                child: SaveButton(
                    countryFormKey: countryFormKey, screen: widget.screen),
              ),
            ],
          ),
        ));
  }
}
