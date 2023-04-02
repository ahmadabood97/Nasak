import 'package:flutter/material.dart';

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
          ListView.separated(
            padding: const EdgeInsets.all(15),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => reviewCardView(),
          )
        ],
      ),
    );
  }
}
