import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../../../../../../../config/routes/app_routes.dart';
import '../example_data.dart';
import '../widgets/appbar_section.dart';
import '../widgets/bag_icon.dart';
import '../widgets/body_section.dart';

class ShopDetailsScreen extends StatefulWidget {
  const ShopDetailsScreen({super.key});

  @override
  ShopDetailsScreenState createState() => ShopDetailsScreenState();
}

class ShopDetailsScreenState extends State<ShopDetailsScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  late AutoScrollController scrollController;
  late TabController tabController;
  final double expandedHeight = 460.0;
  final PageData data = ExampleData.data;
  final double collapsedHeight = kToolbarHeight;

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  @override
  void initState() {
    HttpOverrides.global = MyHttpOverrides();

    tabController = TabController(length: data.categories.length, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) {
        tabController.animateTo(middleIndex);
      }
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: buildSliverScrollView(),
        ),
      ),
    );
  }

  Widget buildSliverScrollView() {
    return Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            buildAppBarSection(),
            buildBody(),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.basketRoute),
            child: Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromARGB(255, 3, 59, 107),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: bagIcon(Colors.orange, "88"),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        "Go to basket (117.50 \$)",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  SliverAppBar buildAppBarSection() {
    return AppBarSection(
      data: data,
      context: context,
      scrollController: scrollController,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
    );
  }

  SliverList buildBody() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildBodySection(index),
        childCount: data.categories.length,
      ),
    );
  }

  Widget buildBodySection(int index) {
    itemKeys[index] = RectGetter.createGlobalKey();
    Category category = data.categories[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        color: Colors.white,
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: BodySection(category: category),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
