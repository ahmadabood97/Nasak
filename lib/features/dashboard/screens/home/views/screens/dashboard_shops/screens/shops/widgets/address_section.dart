import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../../../../../../../auth/screens/login/models/login_response_model.dart';
import '../../../../../../../addresses/controllers/provider/address_provider.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!mounted) return;

        if (Provider.of<LoginProvider>(context, listen: false).loginData !=
            null) {
          LoginResponseModel userData =
              Provider.of<LoginProvider>(context, listen: false).loginData!;
          if (!mounted) return;
          Navigator.pushNamed(context, Routes.addressesRoute);
          Provider.of<AddressProvider>(context, listen: false).getAddress(
            context: context,
            token: userData.authToken,
            stopLoading: () {
              Navigator.pop(context);
            },
          );
        } else {
          showCustomDialog(context, 'Please Login...');
        }
      },
      child: const ListTile(
        leading: Icon(
          Icons.location_on,
          color: Color.fromARGB(255, 24, 15, 77),
        ),
        title: Text("Addresses"),
      ),
    );
  }
}
