import 'package:flutter/material.dart';
import 'package:nasak/config/routes/app_routes.dart';
import 'package:nasak/features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> countryFormKey;
  final String screen;

  const SaveButton(
      {super.key, required this.countryFormKey, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: Consumer<CountriesProvider>(builder: (context, value, child) {
        return InkWell(
          onTap: () async {
            if (countryFormKey.currentState!.validate()) {
              Provider.of<CountriesProvider>(context, listen: false)
                  .saveLocation(
                      Provider.of<CountriesProvider>(context, listen: false)
                          .locationSelectedValue);
              Provider.of<CountriesProvider>(context, listen: false)
                  .saveCountry(
                      Provider.of<CountriesProvider>(context, listen: false)
                          .countriesValue);

              if (screen == "SplashScreen") {
                Navigator.pushReplacementNamed(context, Routes.dashboardRoute);
                Provider.of<CountriesProvider>(context, listen: false)
                    .getCountryData();
                Provider.of<HomeProvider>(context, listen: false).setCurrency(
                    Provider.of<CountriesProvider>(context, listen: false)
                        .countriesValue);
              } else if (screen == "HomeScreen") {
                Navigator.pop(context);
                Navigator.pop(context);
                Provider.of<CountriesProvider>(context, listen: false)
                    .getCountryData();
                Provider.of<HomeProvider>(context, listen: false).setCurrency(
                    Provider.of<CountriesProvider>(context, listen: false)
                        .countriesValue);
              }
            }
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 24, 15, 77),
                borderRadius: BorderRadius.all(Radius.circular(3))),
            height: 50,
            width: 200,
            child: const Center(
              child: Text(
                "Save",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }),
    );
  }
}
