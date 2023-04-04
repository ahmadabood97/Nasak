import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/signout_section.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import 'address_section.dart';
import 'auth_section.dart';
import 'country_language_section.dart';
import 'favorite_section.dart';
import 'need_help_section.dart';

class BodyDrawer extends StatefulWidget {
  const BodyDrawer({super.key});

  @override
  State<BodyDrawer> createState() => _BodyDrawerState();
}

class _BodyDrawerState extends State<BodyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Provider.of<LoginProvider>(context, listen: true).userData != null
            ? const SizedBox()
            : const AuthSection(),
        Padding(
          padding: EdgeInsets.only(
              left: 17,
              right: 17,
              top: Provider.of<LoginProvider>(context, listen: true).userData !=
                      null
                  ? 20
                  : 10),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3))),
            width: double.infinity,
            child: Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.inboxRoute),
                  child: const ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 24, 15, 77),
                    ),
                    title: Text("Inbox"),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.ordersRoute),
                  child: const ListTile(
                    leading: Icon(
                      Icons.shopping_bag,
                      color: Color.fromARGB(255, 24, 15, 77),
                    ),
                    title: Text("Orders"),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                const FavoriteSection(),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                const AddressSection(),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.card_membership_rounded,
                    color: Color.fromARGB(255, 24, 15, 77),
                  ),
                  title: Text("Gift cards"),
                ),
              ],
            ),
          ),
        ),
        needHelpSection(),
        countryLanguageSection(context),
        Provider.of<LoginProvider>(context, listen: true).userData == null
            ? const SizedBox()
            : signoutSection(context)
      ],
    );
  }
}
