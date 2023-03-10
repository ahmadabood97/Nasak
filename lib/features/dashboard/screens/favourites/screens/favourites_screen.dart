import 'package:flutter/material.dart';

import '../widgets/favourite_item_card_view.dart';

class FavoritesScreen extends StatelessWidget {
  final String fromScreen;
  const FavoritesScreen({super.key, required this.fromScreen});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: fromScreen == "Drawer"
              ? AppBar(
                  elevation: 1,
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Favourites',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  leading: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  bottom: const TabBar(
                    physics: NeverScrollableScrollPhysics(),
                    labelColor: Colors.orange,
                    indicatorColor: Colors.orange,
                    labelStyle: TextStyle(fontSize: 15),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Shops',
                      ),
                      Tab(text: 'Items')
                    ],
                  ),
                )
              : AppBar(
                  elevation: 1,
                  backgroundColor: Colors.white,
                  toolbarHeight: 0,
                  bottom: const TabBar(
                    physics: NeverScrollableScrollPhysics(),
                    labelColor: Colors.orange,
                    indicatorColor: Colors.orange,
                    labelStyle: TextStyle(fontSize: 15),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Shops',
                      ),
                      Tab(text: 'Items')
                    ],
                  )),
          body:
              //  screenEmpty(Icons.favorite, "No favorites yet",
              //     "You have not placed any favorites yet."))
              TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Untermainanlage 7, 60329 Frankfurt am Main, Germany ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 43, 78),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) =>
                          favoriteItemCardView(context),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Untermainanlage 7, 60329 Frankfurt am Main, Germany ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 43, 78),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) =>
                          favoriteItemCardView(context),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
