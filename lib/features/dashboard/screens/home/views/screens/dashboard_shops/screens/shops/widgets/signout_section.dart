import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:provider/provider.dart';

Widget signoutSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 17, right: 17, top: 17, bottom: 25),
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Provider.of<LoginProvider>(context, listen: false).logout();
            },
            child: const ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Color.fromARGB(255, 24, 15, 77),
              ),
              title: Text("Sign out"),
            ),
          ),
        ],
      ),
    ),
  );
}
