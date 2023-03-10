import 'package:flutter/material.dart';

import '../../../../../../../../config/routes/app_routes.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back))),
          const Expanded(
            flex: 6,
            child: Center(
              child: Text("Untermainanlage 7, 60329 Fr",
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.searchRoute);
                        },
                        child: const Icon(Icons.search)),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.filterRoute);
                        },
                        child: const Icon(Icons.filter_list)),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
