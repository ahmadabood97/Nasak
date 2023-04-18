import 'package:flutter/material.dart';

import '../../../../../../../../../../core/widgets/shimmer.dart';

Widget addressLoading() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ShimmerWidget.rectangular(
            height: 110,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          );
        },
      ));
}
