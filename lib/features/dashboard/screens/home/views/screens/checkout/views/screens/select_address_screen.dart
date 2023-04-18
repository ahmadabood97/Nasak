import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/addresses/controllers/provider/address_provider.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/checkout/controllers/provider/checkout_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/utils/constants.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          title: const Text(
            "Select Address",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        separatorBuilder: (context, index) => Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        itemCount: Provider.of<AddressProvider>(context, listen: true)
            .addressList
            .length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Provider.of<CheckoutProvider>(context, listen: false).setAddress(
                  Provider.of<AddressProvider>(context, listen: false)
                      .addressList[index]);

              Navigator.pop(context);
            },
            child: Text(Provider.of<AddressProvider>(context, listen: true)
                .addressList[index]
                .addressName
                .toString()),
          );
        },
      ),
    );
  }
}
