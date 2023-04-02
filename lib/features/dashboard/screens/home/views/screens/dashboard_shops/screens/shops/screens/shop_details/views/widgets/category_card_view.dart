import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCardView extends StatefulWidget {
  final String title;
  const CategoryCardView({super.key, required this.title});

  @override
  State<CategoryCardView> createState() => _CategoryCardViewState();
}

class _CategoryCardViewState extends State<CategoryCardView> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl:
                'https://assets.bonappetit.com/photos/57aceacc1b3340441497532d/master/pass/double-rl-ranch-burger.jpg',
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                color: const Color.fromARGB(255, 255, 245, 240),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus",
                        maxLines: isShowMore ? 10 : 2,
                        style: const TextStyle(fontSize: 12),
                        overflowReplacement: Column(
                          // This widget will be replaced.
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus Konig Grill & Burger Haus",
                              maxLines: 2,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShowMore = true;
                                });
                              },
                              child: const Text(
                                "Show more",
                                style: TextStyle(color: Colors.orange),
                              ),
                            )
                          ],
                        ),
                      ),
                      isShowMore
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isShowMore = false;
                                });
                              },
                              child: const Text(
                                "Show less",
                                style: TextStyle(color: Colors.orange),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
