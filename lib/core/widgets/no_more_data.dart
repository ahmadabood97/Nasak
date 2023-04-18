import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget noMoreData(BuildContext context, bool hasMore) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: hasMore
          ? CircularProgressIndicator(
              color: Constants.primaryColor,
            )
          : const SizedBox(),
    ),
  );
}
