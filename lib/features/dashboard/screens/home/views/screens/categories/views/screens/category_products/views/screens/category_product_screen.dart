import 'package:flutter/material.dart';

import '../../../../../../../../../../../../core/utils/assets_manager.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text(
          'Category Product',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.4),
        itemCount: 3,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          ImageAssets.resturantIcon,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Hey',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
