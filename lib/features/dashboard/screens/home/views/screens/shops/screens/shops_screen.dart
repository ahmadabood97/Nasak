import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/home_tab_view.dart';
import '../widgets/select_address.dart';
import '../widgets/select_service_type.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({super.key});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
            width: Constants.getWidth(context) * 0.85,
            backgroundColor: const Color.fromARGB(255, 255, 243, 228),
            child: const MyDrawer()),
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverSafeArea(
                      top: false,
                      sliver: SliverAppBar(
                        elevation: 1,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        pinned: true,
                        floating: true,
                        snap: true,
                        titleSpacing: 0,
                        toolbarHeight: 100,
                        title: Column(
                          children: const [
                            SelectAddress(),
                            SelectServiceType()
                          ],
                        ),
                        centerTitle: true,
                        bottom: TabBar(
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ),
                              color: Colors.orange,
                            ),
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(fontSize: 12),
                            unselectedLabelColor: Colors.black,
                            indicatorPadding: const EdgeInsets.all(10),
                            tabs: const [
                              Tab(
                                text: 'Home',
                              ),
                              Tab(
                                text: 'Feed',
                              ),
                              Tab(
                                text: 'Profile',
                              ),
                              Tab(
                                text: 'Settings',
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  homeTabView('Home Page'),
                  homeTabView('Feed Page'),
                  homeTabView('Profile Page'),
                  homeTabView('Settings Page'),
                ])),
      ),
    );
  }
}
