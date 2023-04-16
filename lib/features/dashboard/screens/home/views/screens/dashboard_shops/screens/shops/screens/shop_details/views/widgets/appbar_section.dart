import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nasak/core/widgets/show_dialog.dart';
import 'package:nasak/features/dashboard/screens/favorites/controllers/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../../../../core/utils/helper.dart';
import '../../../../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../../../../../../../models/app_services_model.dart';
import '../../controllers/provider/shop_provider.dart';
import '../../example_data.dart';
import 'category_tab_view.dart';
import 'ficon_button.dart';

class AppBarSection extends SliverAppBar {
  final ServiceProviders serviceProviders;
  final PageData data;
  final BuildContext context;
  final bool isCollapsed;
  // ignore: annotate_overrides, overridden_fields
  final double expandedHeight;
  @override
  // ignore: overridden_fields
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  const AppBarSection({
    super.key,
    required this.serviceProviders,
    required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 1, pinned: true, forceElevated: true);

  @override
  Color? get backgroundColor =>
      Provider.of<ShopProvider>(context, listen: true).isLoading
          ? Colors.white
          : Colors.orange;

  @override
  Widget? get leading {
    return Center(
      child: FIconButton(
        backgroundColor: isCollapsed ? Colors.white : Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: isCollapsed ? Colors.orange : Colors.white,
        ),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      FIconButton(
        onPressed: () {},
        icon: !isCollapsed
            ? const Icon(
                Icons.info_outline,
                color: Colors.white,
              )
            : const SizedBox(),
      ),
      FIconButton(
        onPressed: () {},
        icon: !isCollapsed
            ? const Icon(
                Icons.favorite_outline,
                color: Colors.white,
              )
            : const SizedBox(),
      ),
    ];
  }

  @override
  Widget? get title {
    var textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      opacity: isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceProviders.name!,
            style: textTheme.subtitle1?.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            strutStyle: Helper.buildStrutStyle(textTheme.subtitle1),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Provider.of<ShopProvider>(context, listen: true).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 245, 240),
              child: categoryTabView(
                  Provider.of<ShopProvider>(context, listen: true)
                      .categoriesList!,
                  serviceProviders.id!,
                  context)),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://assets.bonappetit.com/photos/57aceacc1b3340441497532d/master/pass/double-rl-ranch-burger.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.white,
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        serviceProviders.name!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            height: 1.5,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        serviceProviders.shortDesc!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            height: 1,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            ignoreGestures: true,
                                            initialRating: serviceProviders
                                                .approvedRatingSum!
                                                .toDouble(),
                                            itemSize: 20,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                const Icon(Icons.star,
                                                    color: Colors.orange),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${serviceProviders.approvedTotalReviews!} reviews",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ToggleButtons(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(3)),
                                        isSelected: const [false, false],
                                        onPressed: (int index) async {
                                          if (index == 0) {
                                            Navigator.pushNamed(
                                                context, Routes.aboutRoute,
                                                arguments: serviceProviders.id);
                                          } else {
                                            var userData =
                                                Provider.of<LoginProvider>(
                                                        context,
                                                        listen: false)
                                                    .loginData;

                                            if (userData != null) {
                                              Provider.of<FavoriteProvider>(
                                                      context,
                                                      listen: false)
                                                  .addToFavorites(
                                                      context: context,
                                                      editIsFav: () {
                                                        Provider.of<ShopProvider>(
                                                                context,
                                                                listen: false)
                                                            .editIsFav();
                                                      },
                                                      stopLoading: () {
                                                        Navigator.pop(context);
                                                      },
                                                      shopId:
                                                          serviceProviders.id,
                                                      token:
                                                          userData.authToken);
                                            } else {
                                              showCustomDialog(
                                                  context, 'Please Login...');
                                            }
                                          }
                                        },
                                        children: [
                                          const SizedBox(
                                              height: 45,
                                              width: 45,
                                              child: Icon(Icons.info_outlined)),
                                          SizedBox(
                                              height: 45,
                                              width: 45,
                                              child: Icon(
                                                Provider.of<ShopProvider>(
                                                            context,
                                                            listen: true)
                                                        .isFav
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                color:
                                                    Provider.of<ShopProvider>(
                                                                context,
                                                                listen: true)
                                                            .isFav
                                                        ? Colors.red
                                                        : Colors.black,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // const Text(
                            //   "Offers",
                            //   overflow: TextOverflow.ellipsis,
                            //   maxLines: 2,
                            //   style: TextStyle(
                            //       fontSize: 15, fontWeight: FontWeight.bold),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.all(10),
                            //   decoration: const BoxDecoration(
                            //       color: Color.fromARGB(255, 247, 194, 50),
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(3))),
                            //   height: 80,
                            //   width: 260,
                            //   child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Expanded(
                            //             flex: 2,
                            //             child: Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 const Text(
                            //                   "30% RABATT auf Burger Sushi",
                            //                   overflow: TextOverflow.ellipsis,
                            //                   maxLines: 1,
                            //                   style: TextStyle(
                            //                       fontSize: 14,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //                 const SizedBox(
                            //                   height: 3,
                            //                 ),
                            //                 Text(
                            //                   "30% RABATT auf Burger Sushi",
                            //                   overflow: TextOverflow.ellipsis,
                            //                   maxLines: 1,
                            //                   style: TextStyle(
                            //                     color: Colors.black
                            //                         .withOpacity(0.6),
                            //                     fontSize: 12,
                            //                   ),
                            //                 ),
                            //               ],
                            //             )),
                            //         Expanded(
                            //           flex: 1,
                            //           child: Column(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Delivery and pickup",
                            //                 style: TextStyle(
                            //                     fontSize: 10,
                            //                     color: Colors.black
                            //                         .withOpacity(0.5),
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ]),
                            // )
                          ],
                        )),
                  ),
                ],
              ),
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2 - 65,
                child: const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/33/b8/69/33b869f90619e81763dbf1fccc896d8d--lion-logo-modern-logo.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
