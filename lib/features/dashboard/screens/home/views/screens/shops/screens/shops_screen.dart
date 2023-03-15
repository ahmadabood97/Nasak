import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/home_tab_view.dart';
import '../widgets/select_address.dart';
import '../widgets/select_service_type.dart';
import '../widgets/shop_item_card.dart';

class ShopsScreen extends StatefulWidget {
  final String deliveryLocation;
  const ShopsScreen({super.key, required this.deliveryLocation});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
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
                            SelectAddress(
                                deliveryLocation: widget.deliveryLocation),
                            const SelectServiceType()
                          ],
                        ),
                        centerTitle: true,
                      ),
                    ),
                  )
                ],
            body: Provider.of<HomeProvider>(context, listen: true)
                            .appServicesResponse ==
                        null ||
                    Provider.of<HomeProvider>(context, listen: true).isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                Provider.of<HomeProvider>(context, listen: true)
                                    .appServicesResponse!
                                    .result!
                                    .serviceCategories!
                                    .length,
                                (index) => Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              Provider.of<HomeProvider>(context,
                                                      listen: false)
                                                  .setTabSelected(index),
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                              decoration: BoxDecoration(
                                                  color:
                                                      Provider.of<HomeProvider>(
                                                                      context,
                                                                      listen:
                                                                          true)
                                                                  .tabSelected ==
                                                              index
                                                          ? Colors.orange
                                                          : Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(50))),
                                              child: Text(
                                                Provider.of<HomeProvider>(
                                                        context,
                                                        listen: true)
                                                    .appServicesResponse!
                                                    .result!
                                                    .serviceCategories![index]
                                                    .name!,
                                                style: TextStyle(
                                                    color: Provider.of<HomeProvider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .tabSelected ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ))),
                      ),
                      Provider.of<HomeProvider>(context, listen: true)
                              .shopsList
                              .isNotEmpty
                          ? ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: Provider.of<HomeProvider>(context,
                                      listen: true)
                                  .shopsList
                                  .length,
                              itemBuilder: (context, index) {
                                return shopItemCard(
                                    Provider.of<HomeProvider>(context,
                                            listen: true)
                                        .shopsList[index],
                                    context);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: Constants.getHeight(context) * 0.3,
                                ),
                                const Center(
                                    child: Text(
                                  "There is not any product",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  )),
      ),
    );
  }
}
