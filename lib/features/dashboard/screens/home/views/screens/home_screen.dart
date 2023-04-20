import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/hex_colors.dart';
import '../../controllers/provider/home_provider.dart';
import '../widgets/baner_list.dart';
import 'dashboard_shops/screens/shops/widgets/services_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Provider.of<HomeProvider>(context, listen: true).isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Constants.primaryColor,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HexColor("516586"),
                    HexColor("516586"),
                    HexColor("516586"),
                    HexColor("f07a60"),
                    HexColor("f07a60"),
                  ],
                )),
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          HexColor("ebe2d3"),
                          HexColor("dfceba"),
                          HexColor("ceb49d"),
                        ],
                      )),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: HexColor('193449'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: HexColor('838c9d')),
                                          shape: BoxShape.circle),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: CachedNetworkImage(
                                            width: 35,
                                            height: 35,
                                            imageUrl:
                                                'https://cdn.rallybound.org/content/images/img/6379/PersonIcon2.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: ListView(
                        children: const [
                          BanerList(
                              url:
                                  'https://www.tastingtable.com/img/gallery/what-makes-restaurant-burgers-taste-different-from-homemade-burgers-upgrade/l-intro-1662064407.jpg'),
                          ServicesSection(),
                          BanerList(
                              url:
                                  'https://media.istockphoto.com/id/1176999930/vector/biggest-sale-banner-or-poster-design-with-40-80-discount-offer-and-geometric-elements.jpg?s=612x612&w=0&k=20&c=ouxD5z1ROoIIDJE3oi6ftKgTIsZieHL_86C9yhaGKJU='),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
