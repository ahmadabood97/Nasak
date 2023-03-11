import 'package:flutter/material.dart';
import 'package:nasak/config/routes/app_routes.dart';
import 'package:nasak/features/dashboard/screens/addresses/controllers/provider/address_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/address_card_view.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Addresses',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.addAddressRoute),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Provider.of<AddressProvider>(context, listen: true)
                            .addressList !=
                        null
                    ? Provider.of<AddressProvider>(context, listen: true)
                        .addressList!
                        .length
                    : 0,
                itemBuilder: (context, index) => addressCardView(
                    context,
                    Provider.of<AddressProvider>(context, listen: false)
                        .addressList![index]),
              ),
            ),
          ],
        ));
  }
}
