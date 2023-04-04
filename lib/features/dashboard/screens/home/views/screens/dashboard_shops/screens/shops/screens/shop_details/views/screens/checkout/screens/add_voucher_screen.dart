import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../core/widgets/text_field_custom.dart';
import '../widgets/custom_button.dart';

class AddVoucherScreen extends StatelessWidget {
  const AddVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 245, 240),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Add voucher',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  border: Border.all(color: Colors.grey.withOpacity(0.5))),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.local_offer,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add voucher',
                        style: TextStyle(
                            color: Color.fromARGB(255, 3, 59, 107),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Our discounts include gift cards, vouchers, and any other promotional codes",
                    style: TextStyle(height: 1.5),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Please note that you can no longer choose cash as a payment method if you've applied a discount code to your order.",
                    style: TextStyle(height: 1.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextFieldCustom(
                    title: "Discount code",
                    type: 'name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(const Color.fromARGB(255, 3, 59, 107),
                      "Apply code", Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
