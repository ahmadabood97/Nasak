import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../../../../../../core/utils/constants.dart';
import '../../../../../../../../../../../../core/utils/hex_colors.dart';
import '../../../../../../../../../../../../core/widgets/dropdown.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool checkedValue = false;
  String? amount;
  bool isDelivery = false;

  String dropdownvalue = 'Best match';
  final List<String> dropdownList = [
    'Best match',
    'Reviews',
    'Distance',
    'Delivery costs',
  ];
  final List<String> radioList = [
    'Show all',
    '10.00 \$ or less (439)',
    '15.00 \$ or less (476)',
  ];
  final List<bool> checkList = [
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Filter',
            style:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
          ),
          actions: const [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Show 560 results",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 91, 168),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
          leading: InkWell(
            onTap: () => Navigator.pop(context)
            // setState(() {
            //   DashboardScreenState.pageController.jumpToPage(1);
            // })
            ,
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          )),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Text(
            'Sort by',
            style: TextStyle(
                color: Color.fromARGB(255, 2, 45, 82),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          dropDown('Select your target', '', dropdownList, '', context,
              "FilterScreen"),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Free delivery',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 45, 82),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Switch(
                  activeColor: Constants.primaryColor,
                  value: isDelivery,
                  onChanged: (value) {
                    setState(() {
                      isDelivery = !isDelivery;
                    });
                  }),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Min. order amount',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 45, 82),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: radioList.length,
                itemBuilder: (context, index) => RadioListTile(
                  activeColor: Constants.primaryColor,
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    radioList[index],
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  value: radioList[index],
                  groupValue: amount,
                  onChanged: (value) {
                    setState(() {
                      amount = value.toString();
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Resturant ratings',
            style: TextStyle(
                color: Color.fromARGB(255, 2, 45, 82),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingBar.builder(
            itemPadding: const EdgeInsets.symmetric(horizontal: 5),
            initialRating: 0,
            itemSize: 30,
            minRating: 1,
            direction: Axis.horizontal,
            unratedColor: Colors.grey.withOpacity(0.4),
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) =>
                Icon(Icons.star, color: Constants.primaryColor),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Min. order amount',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 45, 82),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: checkList.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  activeColor: Constants.primaryColor,
                  contentPadding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0, bottom: 0),
                  side: const BorderSide(width: 1, color: Colors.grey),
                  title: Text(
                    'Offers  (92)',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  value: checkList[index],
                  onChanged: (newValue) {
                    setState(() {
                      checkList[index] = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: Text("Reset Filters",
                  style: TextStyle(
                      color: HexColor("e57744"),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
