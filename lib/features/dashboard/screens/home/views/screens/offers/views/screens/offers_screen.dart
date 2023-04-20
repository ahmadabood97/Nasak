import 'package:flutter/material.dart';
import 'package:nasak/core/widgets/no_more_data.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../core/utils/constants.dart';
import '../../../dashboard_shops/screens/shops/widgets/services_section.dart';
import '../../controllers/provider/offer_provider.dart';
import '../widgets/offer_card_view.dart';
import '../widgets/offer_loading.dart';

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
          backgroundColor: Constants.primaryColor,
          title: const Text(
            'Offers',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        body: Provider.of<OffersProvider>(context, listen: true).isLoading
            ? offerLoading()
            : Provider.of<OffersProvider>(context, listen: true)
                    .offersList!
                    .isEmpty
                ? const Center(
                    child: Text("This service does not have any offer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    controller: controller,
                    padding: const EdgeInsets.all(10),
                    itemCount:
                        Provider.of<OffersProvider>(context, listen: true)
                                .offersList!
                                .length +
                            1,
                    itemBuilder: (context, index) => index <
                            Provider.of<OffersProvider>(context, listen: true)
                                .offersList!
                                .length
                        ? offerCardView(
                            context,
                            Provider.of<OffersProvider>(context, listen: true)
                                .offersList![index])
                        : noMoreData(
                            context,
                            Provider.of<OffersProvider>(context, listen: true)
                                .hasMore),
                  ));
  }
}
