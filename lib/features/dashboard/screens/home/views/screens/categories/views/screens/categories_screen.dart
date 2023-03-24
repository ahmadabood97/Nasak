import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../core/utils/constants.dart';
import '../../../../../controllers/provider/home_provider.dart';
import '../../../shops/widgets/services_section.dart';
import '../widgets/category_card_view.dart';

class CategoriesScreen extends StatefulWidget {
  final Params params;

  const CategoriesScreen({super.key, required this.params});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getCategories(
        widget.params.serviceId!, widget.params.deliveryLocations!.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Provider.of<HomeProvider>(context, listen: true)
                      .appServicesResponse ==
                  null ||
              Provider.of<HomeProvider>(context, listen: true).isLoading
          ? Column(
              children: [
                SizedBox(
                  height: Constants.getHeight(context) * 0.3,
                ),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ],
            )
          : GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.4),
              itemCount: Provider.of<HomeProvider>(context, listen: false)
                  .categoriesList
                  .length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return categoryCardView(context, index);
              },
            ),
    );
  }
}
