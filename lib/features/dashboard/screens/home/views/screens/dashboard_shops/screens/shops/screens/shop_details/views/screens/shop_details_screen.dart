import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../../../../../../models/app_services_model.dart';
import '../../controllers/provider/shop_provider.dart';
import '../../example_data.dart';
import '../../models/shop_model.dart';
import '../widgets/appbar_section.dart';
import '../widgets/body_section.dart';

class ShopDetailsScreen extends StatefulWidget {
  final ServiceProviders serviceProviders;

  const ShopDetailsScreen({super.key, required this.serviceProviders});

  @override
  ShopDetailsScreenState createState() => ShopDetailsScreenState();
}

class ShopDetailsScreenState extends State<ShopDetailsScreen>
    with SingleTickerProviderStateMixin {
  final controller = ScrollController();

  bool isCollapsed = false;
  late AutoScrollController scrollController;
  late TabController tabController;
  final double expandedHeight = 480.0;
  final PageData data = ExampleData.data;
  final double collapsedHeight = kToolbarHeight;

  @override
  void initState() {
    tabController = TabController(
        length: Provider.of<ShopProvider>(context, listen: false)
            .categoriesList!
            .length,
        vsync: this);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        Provider.of<ShopProvider>(context, listen: false).getShopDetails(
          widget.serviceProviders.id!,
          Provider.of<ShopProvider>(context, listen: false).catIdSelected,
        );
      }
    });
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: buildSliverScrollView(),
    );
  }

  Widget buildSliverScrollView() {
    return Stack(
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            buildAppBarSection(widget.serviceProviders),
            buildBody(),
          ],
        ),
        // goToBasket(context)
      ],
    );
  }

  SliverAppBar buildAppBarSection(ServiceProviders serviceProviders) {
    return AppBarSection(
      serviceProviders: serviceProviders,
      data: data,
      context: context,
      scrollController: scrollController,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) {},
    );
  }

  SliverList buildBody() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildBodySection(index),
        childCount: Provider.of<ShopProvider>(context, listen: true)
                .productsList!
                .length +
            1,
      ),
    );
  }

  Widget buildBodySection(int index) {
    if (index <
        Provider.of<ShopProvider>(context, listen: true).productsList!.length) {
      SpProducts product =
          Provider.of<ShopProvider>(context, listen: true).productsList![index];

      return Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          BodySection(product: product),
          index !=
                  Provider.of<ShopProvider>(context, listen: false)
                          .productsList!
                          .length -
                      1
              ? const SizedBox(
                  height: 0,
                )
              : const SizedBox(
                  height: 15,
                )
        ],
      );
    } else {
      return Provider.of<ShopProvider>(context, listen: true).hasMore
          ? Provider.of<ShopProvider>(context, listen: true)
                  .productsList!
                  .isEmpty
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  ),
                )
          : const SizedBox();
    }
  }
}