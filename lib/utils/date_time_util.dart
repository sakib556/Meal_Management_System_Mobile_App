import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'navigation.dart';

class DateTimeUtil {
  static DateTime? fromDate;
  static bool isToShowPreviousDate = true;
  static Future<DateTime?> showDatePickerDialog() async {
    final picked = await showDatePicker(
      context: Navigation.key.currentContext!,
      initialDate: DateTime.now(),
      //use to show the previous month
      firstDate: isToShowPreviousDate == true
          ? DateTime(2020, DateTime.december)
          : DateTime.now(),
      lastDate: DateTime.now(),
    );

    fromDate = picked;
    return picked;
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String rangeMY(DateTime start, DateTime? end) {
    final startMonthYear = '${getMonthAbbreviation(start.month)} ${start.year}';
    final endMonthYear = end != null
        ? '${getMonthAbbreviation(end.month)} ${end.year}'
        : 'Present';

    return '$startMonthYear - $endMonthYear';
  }

  static String getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  static StartAndEndMonth getDefaultRange() {
    final DateTime now = DateTime.now();
    final DateTime startDate = DateTime(now.year, now.month, 1);
    final DateTime endDate = DateTime(now.year, now.month + 1, 0);

    return StartAndEndMonth(startTime: startDate, endTime: endDate);
  }

  static String dateFormattingYMD(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String timeFormatting(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  static DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  static String dateAndTimeFormatting(DateTime dateTime) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    final formattedTime = DateFormat.jm().format(dateTime);
    return '$formattedDate, $formattedTime';
  }
}

class StartAndEndMonth {
  final DateTime startTime;
  final DateTime endTime;

  StartAndEndMonth({required this.startTime, required this.endTime});
}
