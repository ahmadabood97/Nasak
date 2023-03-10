import 'package:flutter/material.dart';
import 'package:nasak/config/routes/app_routes.dart';
import '../widgets/address_card_view.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
        body:
            //  screenEmpty(Icons.favorite, "No favorites yet",
            //     "You have not placed any favorites yet."))
            Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) => addressCardView(context),
              ),
            ],
          ),
        ));
  }
}
