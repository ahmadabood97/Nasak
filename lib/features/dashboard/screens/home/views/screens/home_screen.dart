import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/provider/home_provider.dart';
import '../widgets/baner_list.dart';
import 'dashboard_shops/screens/shops/widgets/services_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          leading: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )),
      body: Provider.of<HomeProvider>(context, listen: true).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : ListView(
              children: const [
                BanerList(),
                ServicesSection(),
              ],
            ),
    );
  }
}
