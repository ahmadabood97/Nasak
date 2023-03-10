import 'package:flutter/material.dart';

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
            type == 'password'
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
        TextField(
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
