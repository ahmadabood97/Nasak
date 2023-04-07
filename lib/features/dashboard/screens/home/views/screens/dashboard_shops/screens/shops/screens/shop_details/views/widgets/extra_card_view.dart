import 'package:flutter/material.dart';

import '../../models/shop_model.dart';

class ExtraCardView extends StatefulWidget {
  final List<ProductDetails> productDetails;
  const ExtraCardView({super.key, required this.productDetails});

  @override
  State<ExtraCardView> createState() => _ExtraCardViewState();
}

class _ExtraCardViewState extends State<ExtraCardView> {
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productDetails[0].groupName!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color.fromARGB(255, 35, 109, 170),
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: widget.productDetails.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return widget.productDetails[0].attrType == 3
                ? CheckboxListTile(
                    activeColor: Colors.orange,
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      widget.productDetails[index].optionName!,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                    secondary: const Icon(
                      Icons.info_outline,
                      size: 20,
                    ),
                    value: widget.productDetails[index].isSelected,
                    onChanged: (newValue) {
                      setState(() {
                        widget.productDetails[index].isSelected =
                            !widget.productDetails[index].isSelected;
                      });
                    },
                  )
                : RadioListTile(
                    activeColor: Colors.orange,
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      widget.productDetails[index].optionName!,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    value: widget.productDetails[index].optionName,
                    groupValue:
                        groupValue ?? widget.productDetails[0].optionName,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value.toString();
                      });
                    },
                  );
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
