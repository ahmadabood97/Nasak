import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/checkout/views/screens/delivery_date_time/controllers/provider/delivery_date_time_provider.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DeliveryDateScreen extends StatefulWidget {
  const DeliveryDateScreen({super.key});

  @override
  State<DeliveryDateScreen> createState() => _DeliveryDateScreenState();
}

class _DeliveryDateScreenState extends State<DeliveryDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            "Delivery Date",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        separatorBuilder: (context, index) => Column(
          children: const [
            Divider(thickness: 1),
          ],
        ),
        itemCount: Provider.of<DeliveryDateTimeProvider>(context, listen: true)
            .deliveryDateList
            .length,
        itemBuilder: (context, index) => RadioListTile(
          activeColor: Colors.orange,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            index == 0
                ? "Today"
                : index == 1
                    ? "Tomorrow"
                    : "${DateFormat('d').format(Provider.of<DeliveryDateTimeProvider>(context, listen: true).deliveryDateList[index])} / ${DateFormat('MMM').format(Provider.of<DeliveryDateTimeProvider>(context, listen: true).deliveryDateList[index])}",
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          value: Provider.of<DeliveryDateTimeProvider>(context, listen: true)
              .deliveryDateList[index]
              .toString(),
          groupValue:
              Provider.of<DeliveryDateTimeProvider>(context, listen: true)
                  .daySelected
                  .toString(),
          onChanged: (value) {
            Provider.of<DeliveryDateTimeProvider>(context, listen: false)
                .selectDay(index);
          },
        ),
      ),
    );
  }
}
