import 'package:flutter/material.dart';

import '../widgets/offer_card_view.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Offers',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        body:
            //  screenEmpty(Icons.favorite, "No favorites yet",
            //     "You have not placed any favorites yet."))
            Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) => offersCardView(context),
              )
            ],
          ),
        ));
  }
}
