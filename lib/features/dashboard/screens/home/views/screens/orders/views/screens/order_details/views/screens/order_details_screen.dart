import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/orders/views/screens/order_details/controllers/provider/order_details_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/address_details.dart';
import '../widgets/main_section.dart';
import '../widgets/need_help.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    Provider.of<OrderDetailsProvider>(context, listen: false)
        .getOrderDetails(widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 248),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Order details',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: Provider.of<OrderDetailsProvider>(context, listen: true).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : ListView(
              children: [
                mainSection(
                    Provider.of<OrderDetailsProvider>(context, listen: false)
                        .orderDetailsResponse!),
                const SizedBox(
                  height: 15,
                ),
                addressDetails(),
                const SizedBox(
                  height: 15,
                ),
                needHelp(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
    );
  }
}
