import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../core/widgets/no_more_data.dart';
import '../../controllers/provider/order_provider.dart';
import '../widgets/order_card_view.dart';

class OrdersScreen extends StatefulWidget {
  final String? serviceId;

  const OrdersScreen({super.key, this.serviceId});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    Provider.of<OrdersProvider>(context, listen: false).clear();
    Provider.of<OrdersProvider>(context, listen: false).getOrders(
        widget.serviceId!,
        Provider.of<LoginProvider>(context, listen: false)
            .loginData!
            .authToken!);

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (Provider.of<OrdersProvider>(context, listen: false).hasMore) {
          Provider.of<OrdersProvider>(context, listen: false).getOrders(
              widget.serviceId!,
              Provider.of<LoginProvider>(context, listen: false)
                  .loginData!
                  .authToken!);
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
              'Orders',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
        body: Provider.of<OrdersProvider>(context, listen: true).isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              )
            : Provider.of<OrdersProvider>(context, listen: true)
                    .ordersList!
                    .isEmpty
                ? const Center(
                    child: Text("You do not have any order",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    controller: controller,
                    padding: const EdgeInsets.all(10),
                    itemCount:
                        Provider.of<OrdersProvider>(context, listen: true)
                                .ordersList!
                                .length +
                            1,
                    itemBuilder: (context, index) => index <
                            Provider.of<OrdersProvider>(context, listen: true)
                                .ordersList!
                                .length
                        ? GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.ordersDetailsRoute,
                                arguments:
                                    Provider.of<OrdersProvider>(context, listen: false)
                                        .ordersList![index]
                                        .id),
                            child: orderCardView(
                                context,
                                Provider.of<OrdersProvider>(context, listen: true)
                                    .ordersList![index]))
                        : noMoreData(context, Provider.of<OrdersProvider>(context, listen: true).hasMore),
                  ));
  }
}
