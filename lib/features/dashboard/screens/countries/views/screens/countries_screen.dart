import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/countries/views/widgets/save_button.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/hex_colors.dart';
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
          backgroundColor: Constants.primaryColor,
          title: const Text(
            'Countries',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        body: Form(
          key: countryFormKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor("516586"),
                HexColor("516586"),
                HexColor("516586"),
                HexColor("f07a60"),
                HexColor("f07a60"),
                HexColor("f07a60"),
                HexColor("f07a60"),
              ],
            )),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CachedNetworkImage(
                      height: Constants.getHeight(context) * 0.25,
                      width: Constants.getWidth(context) * 0.5,
                      imageUrl:
                          'https://www.technipages.com/wp-content/uploads/2020/10/fix-google-maps-not-updating-location.png'),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 15),
                    child: Text(
                      "please select a delivery address to see the restaurants",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                  child: dropDown(
                      fillColor: true,
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
                      fillColor: true,
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
          ),
        ));
  }
}
