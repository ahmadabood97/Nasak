import 'package:flutter/material.dart';

Widget dropDown(String dropdownvalue, List<String> items) {
  return DropdownButtonFormField<String>(
    itemHeight: 40,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
    ),
    isExpanded: true,
    value: dropdownvalue,
    icon: const Icon(Icons.keyboard_arrow_down),
    items: items.map((String city) {
      return DropdownMenuItem(
        value: city,
        child: Text(city),
      );
    }).toList(),
    onChanged: (Object? value) {},
  );
}
