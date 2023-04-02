import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/provider/category_details_provider.dart';

Widget noMoreData(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Provider.of<CategoryDetailsProvider>(context, listen: true).hasMore
          ? const CircularProgressIndicator(
              color: Colors.orange,
            )
          : const SizedBox(),
    ),
  );
}
