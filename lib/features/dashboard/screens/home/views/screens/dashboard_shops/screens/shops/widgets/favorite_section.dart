import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../../../../../../../auth/screens/login/models/login_response_model.dart';
import '../../../../../../../favorites/controllers/provider/favorite_provider.dart';

class FavoriteSection extends StatefulWidget {
  const FavoriteSection({super.key});

  @override
  State<FavoriteSection> createState() => _FavoriteSectionState();
}

class _FavoriteSectionState extends State<FavoriteSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Provider.of<LoginProvider>(context, listen: false).userData !=
            null) {
          LoginResponseModel userData =
              Provider.of<LoginProvider>(context, listen: false).userData!;
          if (!mounted) return;
          Provider.of<FavoriteProvider>(context, listen: false).getFavorites(
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
    );
  }
}
