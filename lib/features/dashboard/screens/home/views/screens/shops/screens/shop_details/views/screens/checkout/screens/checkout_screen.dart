import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../../../../../../../core/utils/hex_colors.dart';
import '../../../widgets/bag_icon.dart';
import '../widgets/agree_terms.dart';
import '../widgets/custom_button.dart';
import '../widgets/delivery_address.dart';
import '../widgets/do_have_account.dart';
import '../widgets/personal_details.dart';
import '../widgets/select_data.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 245, 240),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text(
          'Complete your order',
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: bagIcon(const Color.fromARGB(255, 3, 59, 107), "31"),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: doHaveAccount(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: deliveryAddress(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: personalDetails(),
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: selectData(
                      icon: Icons.timer,
                      subtitle: 'As soon as Possible',
                      title: 'Delivery time',
                      image: ''),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: selectData(
                      subtitle: 'Google Pay',
                      title: 'Pay with',
                      image: ImageAssets.googlePayIcon),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.addVoucherRoute),
                    child: const Text(
                      'Add voucher code',
                      style: TextStyle(
                          color: Color.fromARGB(255, 3, 59, 107),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Receive discount, loyalty offers and other updates.',
                        style: TextStyle(fontSize: 12),
                      ),
                      Switch(
                          activeColor: Colors.orange,
                          value: true,
                          onChanged: (value) {}),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: agreeTerms(),
                ),
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total amount',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '30.00 \$',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(child: customButton(HexColor('3359ba'), 'Order and pay'))
        ],
      ),
    );
  }
}