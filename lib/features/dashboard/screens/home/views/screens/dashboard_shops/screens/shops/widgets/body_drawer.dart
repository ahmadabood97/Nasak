import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/models/login_response_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../../../../core/utils/hex_colors.dart';
import '../../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../../../../../addresses/controllers/provider/address_provider.dart';
import '../../../../../../../favorites/controllers/provider/favorite_provider.dart';
import 'custom_button.dart';

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
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 17, bottom: 7),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.signinRoute,
                        arguments: 'home'),
                    child: customButton(
                      context,
                      "Sign in",
                      HexColor('3359ba'),
                      Colors.white,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.signupRoute,
                        arguments: 'home'),
                    child: customButton(context, "Create account", Colors.white,
                        HexColor('3359ba')),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 10),
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
                InkWell(
                  onTap: () {
                    if (Provider.of<LoginProvider>(context, listen: false)
                            .userData !=
                        null) {
                      LoginResponseModel userData =
                          Provider.of<LoginProvider>(context, listen: false)
                              .userData!;
                      if (!mounted) return;
                      Provider.of<FavoriteProvider>(context, listen: false)
                          .getFavorites(
                        context: context,
                        token: userData.authToken,
                        moveToFavoriteScreen: () {
                          Navigator.pushNamed(context, Routes.favoriteRoute,
                              arguments: "Drawer");
                        },
                        stopLoading: () {
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      showCustomDialog(context, 'Please Login...');
                    }
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 24, 15, 77),
                    ),
                    title: Text("Favourites"),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                InkWell(
                  onTap: () async {
                    if (!mounted) return;

                    if (Provider.of<LoginProvider>(context, listen: false)
                            .userData !=
                        null) {
                      LoginResponseModel userData =
                          Provider.of<LoginProvider>(context, listen: false)
                              .userData!;
                      if (!mounted) return;
                      Navigator.pushNamed(context, Routes.addressesRoute);
                      Provider.of<AddressProvider>(context, listen: false)
                          .getAddress(
                        context: context,
                        token: userData.authToken,
                        stopLoading: () {
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      showCustomDialog(context, 'Please Login...');
                    }
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 24, 15, 77),
                    ),
                    title: Text("Addresses"),
                  ),
                ),
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
        Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3))),
            width: double.infinity,
            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: Color.fromARGB(255, 24, 15, 77),
              ),
              title: Text("Need help?"),
              trailing: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Color.fromARGB(255, 24, 15, 77),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 17, right: 17, top: 17, bottom: 30),
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
                    leading: const Icon(
                      Icons.flag,
                      color: Color.fromARGB(255, 24, 15, 77),
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
                const ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Color.fromARGB(255, 24, 15, 77),
                  ),
                  title: Text("Language"),
                  trailing: Text("English"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
