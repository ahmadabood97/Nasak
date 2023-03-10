import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/hex_colors.dart';
import '../../controllers/provider/register_provider.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: InkWell(
        onTap: () {
          Provider.of<RegisterProvider>(context, listen: false).register();
          Navigator.pushReplacementNamed(context, Routes.dashboardRoute);
        },
        child: Container(
          decoration: BoxDecoration(
              color: HexColor('3359ba'),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          height: 50,
          width: 200,
          child: const Center(
            child: Text(
              "Create account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
