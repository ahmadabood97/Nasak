import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nasak/features/auth/screens/login/controllers/provider/login_provider.dart';
import 'package:nasak/features/auth/screens/register/controllers/provider/register_provider.dart';
import 'package:nasak/features/dashboard/screens/addresses/controllers/provider/address_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/hex_colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String title;
  final String type;
  const TextFieldCustom({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            type == 'password_login'
                ? Text(
                    "Forgot password?",
                    style: TextStyle(
                        fontSize: 12,
                        color: HexColor("e57744"),
                        fontWeight: FontWeight.bold),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: type == "address_entrance_num"
                ? Provider.of<AddressProvider>(context, listen: true)
                    .entranceNumController
                : type == "address_floor_num"
                    ? Provider.of<AddressProvider>(context, listen: true)
                        .floorNumController
                    : type == "address_build_name"
                        ? Provider.of<AddressProvider>(context, listen: true)
                            .buildNameController
                        : type == "address_extra_desc"
                            ? Provider.of<AddressProvider>(context, listen: true)
                                .addressExtraController
                            : type == "address_name"
                                ? Provider.of<AddressProvider>(context, listen: true)
                                    .addressNameController
                                : type == "firstname_signup"
                                    ? Provider.of<RegisterProvider>(context, listen: true)
                                        .firstNameController
                                    : type == "lastname_signup"
                                        ? Provider.of<RegisterProvider>(context, listen: true)
                                            .lastNameController
                                        : type == "username_signup"
                                            ? Provider.of<RegisterProvider>(context, listen: true)
                                                .userNameController
                                            : type == "phone_signup"
                                                ? Provider.of<RegisterProvider>(context,
                                                        listen: true)
                                                    .phoneController
                                                : type == "password_signup"
                                                    ? Provider.of<RegisterProvider>(
                                                            context,
                                                            listen: true)
                                                        .passwordController
                                                    : type == "phone_login"
                                                        ? Provider.of<LoginProvider>(
                                                                context,
                                                                listen: true)
                                                            .phoneController
                                                        : type == "password_login"
                                                            ? Provider.of<LoginProvider>(context, listen: true).passwordController
                                                            : null,
            validator: type == "firstname_signup"
                ? RequiredValidator(errorText: "First Name is requierd")
                : type == "lastname_signup"
                    ? RequiredValidator(errorText: "Last Name is requierd")
                    : type == "username_signup"
                        ? RequiredValidator(errorText: "Username is requierd")
                        : type == "phone_login" || type == "phone_signup"
                            ? MultiValidator([
                                RequiredValidator(
                                    errorText: "Phone is requierd"),
                                MinLengthValidator(10,
                                    errorText: 'Phone should be at least 10')
                              ])
                            : type == "password_login" || type == "password_signup"
                                ? MultiValidator([
                                    RequiredValidator(
                                        errorText: "Password is requierd"),
                                    MinLengthValidator(6,
                                        errorText:
                                            'Password should be at least 6')
                                  ])
                                : RequiredValidator(errorText: "requierd"),
            maxLines: type == "note" ? 3 : 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(10.0),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)),
              ),
            ))
      ],
    );
  }
}
