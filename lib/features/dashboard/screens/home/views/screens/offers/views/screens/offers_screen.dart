import 'package:flutter/material.dart';
import 'package:nasak/core/widgets/no_more_data.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../../core/widgets/circular_progress_indicator.dart';
import '../../../dashboard_shops/screens/shops/widgets/services_section.dart';
import '../../controllers/provider/offer_provider.dart';
import '../widgets/offer_card_view.dart';

class OffersScreen extends StatefulWidget {
  final ParamsServiceSection params;

  const OffersScreen({super.key, required this.params});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    Provider.of<OffersProvider>(context, listen: false).clear();

    Provider.of<OffersProvider>(context, listen: false).getOffers(
        widget.params.serviceId!, widget.params.deliveryLocations!.id!);

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (Provider.of<OffersProvider>(context, listen: false).hasMore) {
          Provider.of<OffersProvider>(context, listen: false).getOffers(
              widget.params.serviceId!, widget.params.deliveryLocations!.id!);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Offers',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        body:
            //  screenEmpty(Icons.favorite, "No favorites yet",
            //     "You have not placed any favorites yet."))
            Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            controller: controller,
            children: [
              const SizedBox(
                height: 15,
              ),
              Provider.of<OffersProvider>(context, listen: true).isLoading
                  ? progressIndicator(context)
                  : Provider.of<OffersProvider>(context, listen: true)
                          .offersList!
                          .isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: Constants.getHeight(context) * 0.3,
                            ),
                            const Center(
                              child: Text(
                                "This service doesn't have any offer",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              Provider.of<OffersProvider>(context, listen: true)
                                      .offersList!
                                      .length +
                                  1,
                          itemBuilder: (context, index) => index <
                                  Provider.of<OffersProvider>(context,
                                          listen: true)
                                      .offersList!
                                      .length
                              ? offerCardView(
                                  context,
                                  Provider.of<OffersProvider>(context,
                                          listen: true)
                                      .offersList![index])
                              : noMoreData(
                                  context,
                                  Provider.of<OffersProvider>(context,
                                          listen: true)
                                      .hasMore),
                        )
            ],
          ),
        ));
  }
}
