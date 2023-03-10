import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/constants.dart';
import '../../controllers/provider/home_provider.dart';

class BanerList extends StatefulWidget {
  const BanerList({super.key});

  @override
  State<BanerList> createState() => _BanerListState();
}

class _BanerListState extends State<BanerList> {
  int numberOfBanner = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: Provider.of<HomeProvider>(context, listen: false)
              .home!
              .result!
              .mainBanners!
              .length,
          options: CarouselOptions(
              enlargeCenterPage: true,
              height: Constants.getHeight(context) * 0.25,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enableInfiniteScroll: false,
              reverse: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  numberOfBanner = index;
                });
              }),
          itemBuilder: (context, i, id) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl:
                                //  Provider.of<HomeProvider>(context,
                                //         listen: false)
                                //     .home!
                                //     .result!
                                //     .mainBanners![id]
                                //     .img!
                                "https://graphicsfamily.com/wp-content/uploads/edd/2020/11/Tasty-Food-Web-Banner-Design-scaled.jpg",
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            Provider.of<HomeProvider>(context, listen: false)
                .home!
                .result!
                .mainBanners!
                .length,
            (index) => Container(
              height: 8,
              width: 8,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: numberOfBanner == index ? Colors.orange : Colors.black38,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
