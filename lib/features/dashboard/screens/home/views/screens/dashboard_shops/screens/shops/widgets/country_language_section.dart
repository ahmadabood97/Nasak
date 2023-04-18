import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../../../../core/utils/constants.dart';

Widget countryLanguageSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        left: 17,
        right: 17,
        top: 17,
        bottom:
            Provider.of<LoginProvider>(context, listen: true).loginData != null
                ? 0
                : 25),
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.countriesRoute,
                  arguments: "HomeScreen");
            },
            child: ListTile(
              leading: Icon(
                Icons.flag,
                color: Constants.primaryColor,
              ),
              title: const Text("Country"),
              trailing: Image.asset(
                ImageAssets.germanyIcon,
                height: 20,
                width: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: Constants.primaryColor,
            ),
            title: const Text("Language"),
            trailing: const Text("English"),
          ),
        ],
      ),
    ),
  );
}
