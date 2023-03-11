import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/widgets/dropdown.dart';
import '../../../../../../../../core/widgets/text_field_custom.dart';
import '../../../../../../../auth/screens/register/controllers/provider/register_provider.dart';
import '../../../../../countries/controllers/provider/countries_provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void initState() {
    Provider.of<RegisterProvider>(context, listen: false).countryDropdownList =
        [];
    Provider.of<RegisterProvider>(context, listen: false).citiesDropdownList =
        [];
    Provider.of<RegisterProvider>(context, listen: false).reigonDropdownList =
        [];
    Provider.of<RegisterProvider>(context, listen: false).countrySelectedValue =
        '';
    Provider.of<RegisterProvider>(context, listen: false).citySelectedValue =
        '';
    Provider.of<RegisterProvider>(context, listen: false).reigonSelectedValue =
        '';

    for (var element in Provider.of<CountriesProvider>(context, listen: false)
        .countries!
        .result!
        .countries!) {
      Provider.of<RegisterProvider>(context, listen: false)
          .countryDropdownList
          .add(element.name!);
    }
    super.initState();
  }

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
        dropDown(
            'Select your country',
            Provider.of<RegisterProvider>(context, listen: true)
                .countrySelectedValue,
            Provider.of<RegisterProvider>(context, listen: true)
                .countryDropdownList,
            'Country',
            context,
            "SignUpScreen"),
        const SizedBox(
          height: 15,
        ),
        Provider.of<RegisterProvider>(context, listen: true)
                .citiesDropdownList
                .isNotEmpty
            ? Column(
                children: [
                  dropDown(
                      'Select your city',
                      Provider.of<RegisterProvider>(context, listen: true)
                          .citySelectedValue,
                      Provider.of<RegisterProvider>(context, listen: true)
                          .citiesDropdownList,
                      'City',
                      context,
                      "SignUpScreen"),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )
            : const SizedBox(),
        Provider.of<RegisterProvider>(context, listen: true)
                .reigonDropdownList
                .isNotEmpty
            ? Column(
                children: [
                  dropDown(
                      'Select your reigon',
                      Provider.of<RegisterProvider>(context, listen: true)
                          .reigonSelectedValue,
                      Provider.of<RegisterProvider>(context, listen: true)
                          .reigonDropdownList,
                      'Reigon',
                      context,
                      "SignUpScreen"),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )
            : const SizedBox(),
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
