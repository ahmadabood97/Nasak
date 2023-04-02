import 'package:flutter/material.dart';

import 'body_drawer.dart';
import 'header_drawer.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [HeaderDrawer(), BodyDrawer()],
    );
  }
}
