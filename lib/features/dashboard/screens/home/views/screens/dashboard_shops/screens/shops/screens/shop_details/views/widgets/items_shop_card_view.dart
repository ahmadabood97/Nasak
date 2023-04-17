import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/controllers/provider/shop_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/app_services_model.dart';
import '../../models/shop_model.dart';
import 'extra_card_view.dart';

class ItemsShopCardView extends StatefulWidget {
  final SpProducts product;
  final ServiceProviders serviceProvider;

  const ItemsShopCardView(
      {super.key, required this.product, required this.serviceProvider});

  @override
  State<ItemsShopCardView> createState() => _ItemsShopCardViewState();
}

class _ItemsShopCardViewState extends State<ItemsShopCardView> {
  bool isExtraOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        if (widget.product.productAttAsJson != null &&
            widget.product.productAttAsJson!.isNotEmpty) {
          isExtraOpen = !isExtraOpen;

          if (widget.product.productDetails != null) {
            for (var element in widget.product.productDetails!) {
              element.isSelected = false;
            }
          }
          Provider.of<ShopProvider>(context, listen: false)
              .initialExtraToPriceItem(widget.product);
        } else {
          Provider.of<HomeProvider>(context, listen: false)
              .addToCart(widget.product, widget.serviceProvider);
        }
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.product.name!,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            widget.product.shortDescription!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
                          child: Text(
                              "${widget.product.price} ${Provider.of<HomeProvider>(context, listen: true).currency!.symbol!}",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                          left: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Center(
                          child: Icon(
                        size: 20,
                        isExtraOpen ? Icons.close : Icons.add,
                        color: isExtraOpen
                            ? Colors.black.withOpacity(0.8)
                            : const Color.fromARGB(255, 35, 109, 170),
                      )),
                    ))
              ],
            ),
            isExtraOpen
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color.fromARGB(255, 255, 245, 240),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.product.extraList.length,
                            itemBuilder: (context, index) {
                              return ExtraCardView(
                                productDetails: widget.product.extraList[index],
                                product: widget.product,
                              );
                            },
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 10,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(3)),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.5))),
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (widget.product
                                                        .quantityToCart >
                                                    1) {
                                                  widget.product
                                                      .quantityToCart -= 1;
                                                }
                                              });
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            widget.product.quantityToCart
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.product
                                                      .quantityToCart += 1;
                                                });
                                              },
                                              child: const Icon(Icons.add,
                                                  size: 20))
                                        ],
                                      ),
                                    ),
                                  )),
                              const Expanded(flex: 1, child: SizedBox()),
                              Expanded(
                                  flex: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Provider.of<HomeProvider>(context,
                                              listen: false)
                                          .addToCart(widget.product,
                                              widget.serviceProvider);
                                      setState(() {
                                        isExtraOpen = !isExtraOpen;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(3)),
                                          color: const Color.fromARGB(
                                              255, 3, 59, 107),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.5))),
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          widget.product.priceWithExtra != null
                                              ? "${widget.product.priceWithExtra!} ${Provider.of<HomeProvider>(context, listen: true).currency!.symbol!}"
                                              : widget.product.price != ''
                                                  ? "${double.parse(widget.product.price!) * widget.product.quantityToCart} ${Provider.of<HomeProvider>(context, listen: true).currency!.symbol!}"
                                                  : '1 ${Provider.of<HomeProvider>(context, listen: true).currency!.symbol!}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
