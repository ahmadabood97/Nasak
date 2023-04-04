import 'package:flutter/material.dart';
import 'package:nasak/core/utils/constants.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/controllers/provider/about_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/head_section.dart';
import '../widgets/review_card_view.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          headSection(context),
          Provider.of<AboutProvider>(context, listen: true).isLoading
              ? Column(
                  children: [
                    SizedBox(
                      height: Constants.getHeight(context) * 0.3,
                    ),
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                )
              : Provider.of<AboutProvider>(context, listen: true)
                      .reviewsList
                      .isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.all(15),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          Provider.of<AboutProvider>(context, listen: false)
                              .reviewsList
                              .length,
                      itemBuilder: (context, index) => reviewCardView(
                          Provider.of<AboutProvider>(context, listen: false)
                              .reviewsList[index]),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: Constants.getHeight(context) * 0.25,
                        ),
                        const Center(
                            child: Text(
                          "There is not any review",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    )
        ],
      ),
    );
  }
}
