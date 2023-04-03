import 'package:flutter/material.dart';

Widget noMoreData(BuildContext context, bool hasMore) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: hasMore
          ? const CircularProgressIndicator(
              color: Colors.orange,
            )
          : const SizedBox(),
    ),
  );
}
