import 'package:flutter/material.dart';

import '../../../../../../../auth/widgets/text_field_custom.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Add Address',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
            )
          ],
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: ListView(padding: const EdgeInsets.all(15), children: [
        const TextFieldCustom(title: "Area", type: "name"),
        const SizedBox(
          height: 15,
        ),
        const TextFieldCustom(title: "Building Type", type: "name"),
        const SizedBox(
          height: 15,
        ),
        const TextFieldCustom(title: "Street name", type: "name"),
        const SizedBox(
          height: 15,
        ),
        const TextFieldCustom(title: "Building name/number", type: "name"),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [
            Expanded(
                flex: 8,
                child: TextFieldCustom(title: "Floor number", type: "num")),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 8,
                child: TextFieldCustom(title: "Apartment number", type: "num")),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const TextFieldCustom(
            title: "Landmark. group number. etc", type: "name"),
        const SizedBox(
          height: 15,
        ),
        const TextFieldCustom(title: "Address name", type: "name"),
      ]),
    );
  }
}
