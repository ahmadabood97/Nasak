import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../controllers/provider/delivery_date_time_provider.dart';

class DeliveryTimeScreen extends StatefulWidget {
  const DeliveryTimeScreen({super.key});

  @override
  State<DeliveryTimeScreen> createState() => _DeliveryTimeScreenState();
}

class _DeliveryTimeScreenState extends State<DeliveryTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: GestureDetector(
            onTap: () {
              Provider.of<DeliveryDateTimeProvider>(context, listen: false)
                  .setDeliveryTimeList(
                      startHour: 4,
                      lastHour: 17,
                      interval: 30,
                      perparingTime: 30,
                      offest: 180);
            },
            child: const Text(
              "Delivery Time",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        separatorBuilder: (context, index) => Column(
          children: const [
            Divider(thickness: 1),
          ],
        ),
        itemCount: Provider.of<DeliveryDateTimeProvider>(context, listen: true)
            .deliveryTimeList
            .length,
        itemBuilder: (context, index) => RadioListTile(
          activeColor: Colors.orange,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            "${DateFormat('HH').format(Provider.of<DeliveryDateTimeProvider>(context, listen: true).deliveryTimeList[index])}:${DateFormat('mm').format(Provider.of<DeliveryDateTimeProvider>(context, listen: true).deliveryTimeList[index])}",
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          value: Provider.of<DeliveryDateTimeProvider>(context, listen: true)
              .deliveryTimeList[index]
              .toString(),
          groupValue:
              Provider.of<DeliveryDateTimeProvider>(context, listen: true)
                  .timeSelected
                  .toString(),
          onChanged: (value) {
            setState(() {
              Provider.of<DeliveryDateTimeProvider>(context, listen: false)
                  .selectTime(index);
            });
          },
        ),
      ),
    );
  }
}
