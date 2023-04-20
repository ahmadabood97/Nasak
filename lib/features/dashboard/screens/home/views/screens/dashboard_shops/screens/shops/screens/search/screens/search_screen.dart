import 'package:flutter/material.dart';

import '../../../../../../../../../../../../core/utils/constants.dart';
import '../widgets/search_item_card_view.dart';
import '../widgets/search_place_card_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String serviceType = 'Places';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: TextField(
            cursorColor: Constants.primaryColor,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search by place or item',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context)
            // DashboardScreenState.pageController.jumpToPage(1)
            ,
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          )),
      body: Stack(children: [
        ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              itemCount: 8,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: serviceType == 'Places'
                    ? searchPlaceCardView(context)
                    : searchItemCardView(context),
              ),
            ),
          ],
        ),
        selectTypeSearch()
      ]),
      // screenEmpty(Icons.search, "We've made it easier to search!",
      //     "you can now search by place or item in the search bar"),
    );
  }

  Widget selectTypeSearch() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        serviceType = 'Places';
                      });
                    },
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          "Places (96)",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: serviceType == "Places"
                                  ? Constants.primaryColor
                                  : Colors.black),
                        ))),
                  ),
                  serviceType == "Places"
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: Constants.primaryColor,
                          ),
                        )
                      : Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        serviceType = 'Items';
                      });
                    },
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          "Items (56)",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: serviceType == "Items"
                                  ? Constants.primaryColor
                                  : Colors.black),
                        ))),
                  ),
                  serviceType == 'Items'
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: Constants.primaryColor,
                          ),
                        )
                      : Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 3,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
