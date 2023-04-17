import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/register/controllers/provider/register_provider.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../features/dashboard/screens/countries/controllers/provider/countries_provider.dart';

Widget dropDown(String hint, String value, List<String> items, String title,
    BuildContext context, String screen) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      const SizedBox(
        height: 10,
      ),
      DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null) {
            return "$title is required";
          } else {
            return null;
          }
        },
        hint: Text(hint),
        value: value == '' ? null : value,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
        ),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String city) {
          return DropdownMenuItem(
            value: city,
            child: Text(city),
          );
        }).toList(),
        onChanged: (Object? value) {
          if (screen == "SignUpScreen" || screen == "AddAddressScreen") {
            if (title == "Country") {
              Provider.of<RegisterProvider>(context, listen: false)
                  .clearCitiesList();
              Provider.of<RegisterProvider>(context, listen: false)
                  .clearReigonList();
              for (var element
                  in Provider.of<CountriesProvider>(context, listen: false)
                      .countries!
                      .result!
                      .countries![items.indexOf(value.toString())]
                      .cities!) {
                Provider.of<RegisterProvider>(context, listen: false)
                    .addToCityDropdownList(element.name!);
              }
              Provider.of<RegisterProvider>(context, listen: false)
                  .setCountrySelectedIndex(
                      items.indexOf(value.toString()), value.toString());
            } else if (title == "City") {
              Provider.of<RegisterProvider>(context, listen: false)
                  .clearReigonList();
              for (var element
                  in Provider.of<CountriesProvider>(context, listen: false)
                      .countries!
                      .result!
                      .countries![
                          Provider.of<RegisterProvider>(context, listen: false)
                              .countrySelectedIndex]
                      .cities![items.indexOf(value.toString())]
                      .regions!) {
                Provider.of<RegisterProvider>(context, listen: false)
                    .addToReigonDropdownList(element.name!);
              }
              Provider.of<RegisterProvider>(context, listen: false)
                  .setCitySelectedIndex(
                      items.indexOf(value.toString()), value.toString());
            } else if (title == "Reigon") {
              Provider.of<RegisterProvider>(context, listen: false)
                  .setReigonSelectedIndex(
                      items.indexOf(value.toString()), value.toString());
            }
          } else if (screen == "CountriesScreen") {
            if (title == "Country") {
              for (var element
                  in Provider.of<CountriesProvider>(context, listen: false)
                      .countries!
                      .result!
                      .countries!) {
                if (element.name == value.toString()) {
                  Provider.of<CountriesProvider>(context, listen: false)
                      .setCountrySelected(element);
                }
              }
            } else if (title == "Location") {
              for (var element
                  in Provider.of<HomeProvider>(context, listen: false)
                      .home!
                      .result!
                      .deliveryLocations!) {
                if (element.deliveryRegionName == value.toString()) {
                  Provider.of<CountriesProvider>(context, listen: false)
                      .setLocationsSelectedValue(element);
                }
              }
            }
          }
        },
      )
    ],
  );
}
