import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/provider/home_provider.dart';

Widget noMoreData(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Provider.of<HomeProvider>(context, listen: true).hasMore
          ? const CircularProgressIndicator(
              color: Colors.orange,
            )
          : const Text(
              "No more data to load",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
    ),
  );
}