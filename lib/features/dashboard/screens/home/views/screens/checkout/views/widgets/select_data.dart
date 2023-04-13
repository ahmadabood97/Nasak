import 'package:flutter/material.dart';

Widget selectData({
  IconData? icon,
  String? image,
  String? title,
  String? subtitle,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          color: const Color.fromARGB(255, 3, 59, 107),
                        )
                      : Image.asset(
                          image!,
                          height: 25,
                          width: 25,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 3, 59, 107)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        subtitle!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
