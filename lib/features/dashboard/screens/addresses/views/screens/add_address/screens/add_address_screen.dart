
import 'package:flutter/material.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:nasak/features/dashboard/screens/addresses/controllers/provider/address_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/widgets/dropdown.dart';
import '../../../../../../../../core/widgets/text_field_custom.dart';
import '../../../../../../../auth/screens/login/models/login_response_model.dart';
import '../../../../../../../auth/screens/register/controllers/provider/register_provider.dart';
import '../../../../../countries/controllers/provider/countries_provider.dart';
import '../../../../models/address_model.dart';
import '../widgets/add_location.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();


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

    Provider.of<RegisterProvider>(context, listen: false).countryId = '';
    Provider.of<RegisterProvider>(context, listen: false).cityId = '';
    Provider.of<RegisterProvider>(context, listen: false).reigonId = '';

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
          actions: [
            InkWell(
              onTap: () async {
                if (addAddressFormKey.currentState!.validate()) {
                  LoginResponseModel userData =
                      Provider.of<LoginProvider>(context, listen: false)
                          .loginData!;
                  if (!mounted) return;
                  Provider.of<RegisterProvider>(context, listen: false)
                      .setCountryCityReigonId();
                  Provider.of<AddressProvider>(context, listen: false)
                      .addAddress(
                    context: context,
                    addersses: Addersses(
                        addressExtraDesc:
                            Provider.of<AddressProvider>(context, listen: false)
                                .addressExtraController
                                .text,
                        addressName:
                            Provider.of<AddressProvider>(context, listen: false)
                                .addressNameController
                                .text,
                        buildName: Provider.of<AddressProvider>(context, listen: false)
                            .buildNameController
                            .text,
                        cityGuid: Provider.of<RegisterProvider>(context, listen: false)
                            .cityId,
                        countryGuid:
                            Provider.of<RegisterProvider>(context, listen: false)
                                .countryId,
                        entranceNum:
                            Provider.of<AddressProvider>(context, listen: false)
                                .entranceNumController
                                .text,
                        firstname: userData.firstName,
                        floorNum:
                            Provider.of<AddressProvider>(context, listen: false)
                                .floorNumController
                                .text,
                        lastname: userData.lastName,
                        locLat: '30',
                        locLong: '30',
                        phonenumber: userData.primaryPhoneNum,
                        regionGuid:
                            Provider.of<RegisterProvider>(context, listen: false).reigonId,
                        userAddress: "${Provider.of<RegisterProvider>(context, listen: false).countrySelectedValue}-${Provider.of<RegisterProvider>(context, listen: false).citySelectedValue}-${Provider.of<RegisterProvider>(context, listen: false).reigonSelectedValue}"),
                    userData: userData,
                    stopLoading: () {
                      Navigator.pop(context);
                    },
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
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
      body: Form(
        key: addAddressFormKey,
        child: ListView(padding: const EdgeInsets.all(15), children: [
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
          Column(
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
          ),
          Column(
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
          ),
          const TextFieldCustom(title: "Address Name", type: "address_name"),
          const SizedBox(
            height: 15,
          ),
          const TextFieldCustom(
              title: "Address Extra Description", type: "address_extra_desc"),
          const SizedBox(
            height: 15,
          ),
          const TextFieldCustom(
              title: "Build Name", type: "address_build_name"),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Expanded(
                  flex: 8,
                  child: TextFieldCustom(
                      title: "Floor Number", type: "address_floor_num")),
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 8,
                  child: TextFieldCustom(
                      title: "Entrance Num", type: "address_entrance_num")),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
 const  AddLocation(),
        ]),
      ),
    );
  }
}
