import 'package:flutter/material.dart';

import 'shop_item_card.dart';

Widget homeTabView(String text) => SafeArea(
      top: false,
      bottom: false,
      child: Builder(builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Row(
                children: const [
                  Text(
                    "Order from 560 places",
                    style: TextStyle(
                        height: 1, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 18,
                  )
                ],
              ),
            ),
            CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context)),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      const childCount = 25;
                      final hasSeparator = index != childCount - 1;
                      final double bottom = hasSeparator ? 12 : 0;
                      final child = shopItemCard(index + 1, context);
                      return Container(
                        margin: EdgeInsets.only(bottom: bottom),
                        child: child,
                      );
                    }, childCount: 25)),
                  )
                ]),
          ],
        );
      }),
    );
