import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';

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
        if (Provider.of<LoginProvider>(context, listen: false).loginData !=
            null) {
          Navigator.pushNamed(context, Routes.favoriteRoute, arguments: '');
        } else {
          showCustomDialog(context, 'Please Login...');
        }
      },
      child: ListTile(
        leading: Icon(
          Icons.favorite,
          color: Constants.primaryColor,
        ),
        title: const Text("Favourites"),
      ),
    );
  }
}
