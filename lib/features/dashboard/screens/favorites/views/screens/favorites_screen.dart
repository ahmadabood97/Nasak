import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/favorites/controllers/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/favorite_item_card_view.dart';

class FavoritesScreen extends StatelessWidget {
  final String fromScreen;
  const FavoritesScreen({super.key, required this.fromScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fromScreen == "Drawer"
          ? AppBar(
              elevation: 1,
              backgroundColor: Colors.orange,
              title: const Text(
                'Favorite',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )
          : AppBar(
              elevation: 1,
              backgroundColor: Colors.orange,
              title: const Text(
                'Favorite',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: Provider.of<FavoriteProvider>(context, listen: true)
            .favoriteList
            .length,
        itemBuilder: (context, index) => FavoriteItemCardView(
          item: Provider.of<FavoriteProvider>(context, listen: true)
              .favoriteList[index],
        ),
      ),
    );
  }
}
