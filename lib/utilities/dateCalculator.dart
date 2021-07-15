import 'package:intl/intl.dart';

DateTime getDay() {
  return new DateTime.now();
}

String getDate(int number) {
  DateTime now = DateTime(getDay().year, getDay().month, getDay().day + number);

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

String getWeekday(int weekNum) {
  switch (weekNum) {
    case 1:
      return 'Sunday';
    case 2:
      return 'Monday';
    case 3:
      return 'Tuesday';
    case 4:
      return 'Wednesday';
    case 5:
      return 'Thursday';
    case 6:
      return 'Friday';
    case 7:
      return 'Saturday';
    case 8:
      return 'Sunday';
    default:
      return 'something is wrong';
  }
}
