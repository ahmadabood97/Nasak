import 'package:flutter/material.dart';

import '../example_data.dart';

class ItemsShopCardView extends StatefulWidget {
  final Food food;
  final bool isLastIndex;
  const ItemsShopCardView(
      {super.key, required this.food, required this.isLastIndex});

  @override
  State<ItemsShopCardView> createState() => _ItemsShopCardViewState();
}

class _ItemsShopCardViewState extends State<ItemsShopCardView> {
  bool isExtraOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isExtraOpen = !isExtraOpen;
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Gebrate Einerdeln",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 8, right: 8, left: 8),
                          child: Text("4.50 \$",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                          left: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Center(
                          child: Icon(
                        size: 20,
                        isExtraOpen ? Icons.close : Icons.add,
                        color: isExtraOpen
                            ? Colors.black.withOpacity(0.8)
                            : const Color.fromARGB(255, 35, 109, 170),
                      )),
                    ))
              ],
            ),
            isExtraOpen
                ? Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 255, 245, 240),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ihre Zubereitung",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 35, 109, 170),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3)),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Italian, O 26cm",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded,
                                        size: 15)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Ihre Extras",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color.fromARGB(255, 35, 109, 170),
                          ),
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text(
                                "mit Ananas  (+ 1.00 \$)",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              secondary: const Icon(
                                Icons.info_outline,
                                size: 20,
                              ),
                              value: false,
                              onChanged: (newValue) {
                                setState(() {});
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color.fromARGB(255, 35, 109, 170),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Show 20 more",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 35, 109, 170),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3)),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5))),
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Icon(Icons.add, size: 20)
                                    ],
                                  ),
                                )),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3)),
                                      color:
                                          const Color.fromARGB(255, 3, 59, 107),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5))),
                                  height: 40,
                                  child: const Center(
                                    child: Text(
                                      "8.99 \$",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
