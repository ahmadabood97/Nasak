import 'package:flutter/material.dart';

import 'info.dart';
import 'reviews.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            bottom: const TabBar(
              labelColor: Colors.orange,
              indicatorColor: Colors.orange,
              labelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Info',
                ),
                Tab(text: 'Reviews')
              ],
            ),
            title: Text(
              'Crown of India Restaurant',
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            )),
        body: const TabBarView(
          children: [Info(), Reviews()],
        ),
      ),
    );
  }
}
