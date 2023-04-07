import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/provider/about_provider.dart';
import 'info.dart';
import 'offers.dart';
import 'reviews.dart';

class AboutScreen extends StatefulWidget {
  final String shopId;
  const AboutScreen({super.key, required this.shopId});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    Provider.of<AboutProvider>(context, listen: false).clear();
    Provider.of<AboutProvider>(context, listen: false).getAbout(widget.shopId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                Tab(text: 'Reviews'),
                Tab(text: 'Offers'),
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
          children: [Info(), Reviews(), Offers()],
        ),
      ),
    );
  }
}
