import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DeliveryDateTimeProvider extends ChangeNotifier {
  List<DateTime> deliveryDateList = [];

  DateTime? _daySelected;
  DateTime? get daySelected => _daySelected;

  String? _daySelectedString;
  String? get daySelectedString => _daySelectedString;

////////////////////////////////////////////////////////////

  List<DateTime> deliveryTimeList = [];

  DateTime? _timeSelected;
  DateTime? get timeSelected => _timeSelected;

  final _currentDate = DateTime.now();

  DateTime _currentTime = DateTime.now().toUtc();

  void setDeliveryDateList(int lastDay) {
    deliveryDateList.clear();
    for (int i = 0; i < lastDay; i++) {
      final date = _currentDate.add(Duration(days: i));
      deliveryDateList.add(date);
    }
    _daySelected = deliveryDateList[0];
    _daySelectedString = "Today";
  }

  void selectDay(int index) {
    for (int i = 0; i < deliveryDateList.length; i++) {
      if (i == index) {
        index == 0
            ? _daySelectedString = "Today"
            : index == 1
                ? _daySelectedString = "Tomorrow"
                : _daySelectedString =
                    "${DateFormat('d').format(deliveryDateList[index])} / ${DateFormat('MMM').format(deliveryDateList[index])}";

        _daySelected = deliveryDateList[i];
        notifyListeners();
        break;
      }
    }
  }

  void setDeliveryTimeList(
      {required int startHour,
      required int lastHour,
      required int interval,
      required int perparingTime,
      required int offest}) {
    deliveryTimeList.clear();
    _currentTime = DateTime.now().toUtc();

    for (int i = 1; i < 1000; i++) {
      if (DateTime.parse(_currentTime
                  .add(Duration(
                      minutes: i == 1
                          ? perparingTime + offest
                          : ((interval * i) + offest)))
                  .toString())
              .hour >=
          lastHour) {
        break;
      }
      if (DateTime.parse(
                      _currentTime.add(Duration(minutes: (offest))).toString())
                  .hour <
              lastHour &&
          DateTime.parse(
                      _currentTime.add(Duration(minutes: (offest))).toString())
                  .hour >=
              startHour) {
        deliveryTimeList.add(DateTime.parse(_currentTime
            .add(Duration(
                minutes: i == 1
                    ? perparingTime + offest
                    : ((interval * i) + offest)))
            .toString()));
      }
    }
    if (deliveryTimeList.isNotEmpty) {
      _timeSelected = deliveryTimeList[0];
    }
  }

  void selectTime(int index) {
    for (int i = 0; i < deliveryTimeList.length; i++) {
      if (i == index) {
        _timeSelected = deliveryTimeList[i];
        notifyListeners();
        break;
      }
    }
  }
}
