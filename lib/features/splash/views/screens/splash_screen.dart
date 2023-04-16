import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../dashboard/screens/countries/controllers/provider/countries_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<CountriesProvider>(context, listen: false).getCountryData();
    Provider.of<CountriesProvider>(context, listen: false).getLocationData();
    Provider.of<CountriesProvider>(context, listen: false).getCountries();
    Provider.of<LoginProvider>(context, listen: false).getUserData();
    Provider.of<HomeProvider>(context, listen: false).getHome(moveTohome: () {
      if (Provider.of<CountriesProvider>(context, listen: false)
                  .countriesValue
                  .id ==
              null ||
          Provider.of<CountriesProvider>(context, listen: false)
                  .locationSelectedValue
                  .id ==
              null) {
        Navigator.pushReplacementNamed(context, Routes.countriesRoute,
            arguments: "SplashScreen");
      } else {
        Provider.of<HomeProvider>(context, listen: false).setCurrency(
            Provider.of<CountriesProvider>(context, listen: false)
                .countriesValue);
        Navigator.pushReplacementNamed(context, Routes.dashboardRoute);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/premium-vector/express-delivery-logo-design-vector-template_441059-204.jpg?w=2000',
              height: 250,
              fit: BoxFit.cover,
            ),
            Text(
              "Nasak Delivery App ",
              style: GoogleFonts.alike(
                textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
