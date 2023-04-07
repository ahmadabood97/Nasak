import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../../../../../../../core/utils/constants.dart';
import '../../controllers/provider/about_provider.dart';
import '../widgets/offer_card_view.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<AboutProvider>(context, listen: true).isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          )
        : Provider.of<AboutProvider>(context, listen: true)
                .reviewsList
                .isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Provider.of<AboutProvider>(context, listen: true)
                    .offersList
                    .length,
                itemBuilder: (context, index) => offerCardView(
                    context,
                    Provider.of<AboutProvider>(context, listen: true)
                        .offersList[index]),
              )
            : Column(
                children: [
                  SizedBox(
                    height: Constants.getHeight(context) * 0.35,
                  ),
                  const Center(
                      child: Text(
                    "There is not any offer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              );
  }
}
