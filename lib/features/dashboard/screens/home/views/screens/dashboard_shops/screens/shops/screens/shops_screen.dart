import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../core/widgets/circular_progress_indicator.dart';
import '../../../../../../../../../../core/widgets/no_more_data.dart';
import '../../../../../../controllers/provider/home_provider.dart';
import '../widgets/categories_tab_view.dart';
import '../widgets/select_address.dart';
import '../widgets/select_service_type.dart';
import '../widgets/services_section.dart';
import '../widgets/shop_item_card.dart';

class ShopsScreen extends StatefulWidget {
  final ParamsServiceSection params;
  const ShopsScreen({super.key, required this.params});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).clear();
    Provider.of<HomeProvider>(context, listen: false).getShops(
        widget.params.serviceId!,
        Provider.of<CountriesProvider>(context, listen: false)
            .locationSelectedValue
            .id!);

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (Provider.of<HomeProvider>(context, listen: false).hasMore) {
          Provider.of<HomeProvider>(context, listen: false).getShops(
              widget.params.serviceId!,
              Provider.of<CountriesProvider>(context, listen: false)
                  .locationSelectedValue
                  .id!);
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverSafeArea(
                      top: false,
                      sliver: SliverAppBar(
                        elevation: 1,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        pinned: true,
                        floating: true,
                        snap: true,
                        titleSpacing: 0,
                        toolbarHeight: 100,
                        title: Column(
                          children: [
                            SelectAddress(serviceId: widget.params.serviceId!),
                            const SelectServiceType()
                          ],
                        ),
                        centerTitle: true,
                      ),
                    ),
                  )
                ],
            body: RefreshIndicator(
              color: Colors.orange,
              onRefresh: () {
                return Provider.of<HomeProvider>(context, listen: false)
                    .refresh(
                        widget.params.serviceId!,
                        Provider.of<CountriesProvider>(context, listen: false)
                            .locationSelectedValue
                            .id!);
              },
              child: ListView(
                controller: controller,
                padding: EdgeInsets.zero,
                children: [
                  categoriesTabView(
                      context,
                      Provider.of<HomeProvider>(context, listen: true)
                          .categoriesShopsList,
                      widget.params.serviceId!,
                      Provider.of<CountriesProvider>(context, listen: true)
                          .locationSelectedValue
                          .id!),
                  Provider.of<HomeProvider>(context, listen: true).isLoading
                      ? progressIndicator(context)
                      : Provider.of<HomeProvider>(context, listen: true)
                              .shopsList
                              .isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                  height: Constants.getHeight(context) * 0.3,
                                ),
                                const Center(
                                  child: Text(
                                    "This category doesn't have any product",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              shrinkWrap: true,
                              itemCount: Provider.of<HomeProvider>(context,
                                          listen: true)
                                      .shopsList
                                      .length +
                                  1,
                              itemBuilder: (context, index) {
                                if (index <
                                    Provider.of<HomeProvider>(context,
                                            listen: true)
                                        .shopsList
                                        .length) {
                                  Provider.of<HomeProvider>(context,
                                          listen: true)
                                      .shopsList[index]
                                      .index = index;
                                }

                                return index <
                                        Provider.of<HomeProvider>(context,
                                                listen: true)
                                            .shopsList
                                            .length
                                    ? shopItemCard(
                                        Provider.of<HomeProvider>(context,
                                                listen: true)
                                            .shopsList[index],
                                        context)
                                    : noMoreData(
                                        context,
                                        Provider.of<HomeProvider>(context,
                                                listen: true)
                                            .hasMore);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                            ),
                ],
              ),
            )),
      ),
    );
  }
}
