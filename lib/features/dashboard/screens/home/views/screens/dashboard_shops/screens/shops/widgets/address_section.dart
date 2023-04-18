import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';

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
          Navigator.pushNamed(context, Routes.addressesRoute);
        } else {
          showCustomDialog(context, 'Please Login...');
        }
      },
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: Constants.primaryColor,
        ),
        title: const Text("Addresses"),
      ),
    );
  }
}
