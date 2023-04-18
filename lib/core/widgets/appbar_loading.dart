import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../core/widgets/shimmer.dart';

Widget appbarLoading() {
  return SingleChildScrollView(
    padding: const EdgeInsets.only(top: 10),
    scrollDirection: Axis.horizontal,
    child: Row(
        children: List.generate(
            10,
            (index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(
                          height: 40,
                          child: ShimmerWidget.circular(
                            height: 40,
                            width: 60,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )),
                    ],
                  ),
                ))),
  );
}
