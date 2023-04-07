import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/favorites/controllers/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../widgets/favorite_item_card_view.dart';

class FavoritesScreen extends StatefulWidget {
  final String serviceId;
  const FavoritesScreen({super.key, required this.serviceId});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false).clear();
    Provider.of<FavoriteProvider>(context, listen: false).getFavorites(
      widget.serviceId,
      context: context,
      token: Provider.of<LoginProvider>(context, listen: false)
          .loginData!
          .authToken!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.orange,
        title: const Text(
          'Favorite',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Provider.of<FavoriteProvider>(context, listen: true).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : Provider.of<FavoriteProvider>(context, listen: true)
                  .favoriteList
                  .isEmpty
              ? const Center(
                  child: Text("Favorite list is empty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemCount:
                      Provider.of<FavoriteProvider>(context, listen: true)
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
