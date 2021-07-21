import 'package:intl/intl.dart';
import 'package:quiver/time.dart';

DateTime getDay() {
  return new DateTime.now();
}

String getDate(int number) {
  DateTime now = DateTime(getDay().year, getDay().month, getDay().day + number);

  final DateFormat formatter = DateFormat('E,dd-MM-yyyy');
  return formatter.format(now);
}

String getDayFromString(List<DateTime> array) {
  DateTime firstDay = DateTime(array[0].year, array[0].month, array[0].day);
  DateTime lastDay = DateTime(array[1].year, array[1].month, array[1].day);
  final DateFormat formatter = DateFormat('E,dd-MM-yyyy');
  return formatter.format(firstDay) + '  -  ' + formatter.format(lastDay);
}

String getMonth() {
  DateTime now = DateTime(getDay().year, getDay().month, getDay().day);
  DateTime firstDay = DateTime(getDay().year, getDay().month, 1);

  final DateFormat formatter = DateFormat('E,dd-MM-yyyy');
  return formatter.format(firstDay) + '  -  ' + formatter.format(now);
}

String lastMonth() {
  DateTime firstDay = DateTime(getDay().year, getDay().month - 1, 1);
  DateTime lastDay = DateTime(getDay().year, getDay().month - 1,
      daysInMonth(getDay().year, getDay().month) - 1);
  final DateFormat formatter = DateFormat('E-yyyy-MM-dd');
  return formatter.format(firstDay) + '  -  ' + formatter.format(lastDay);
}

List<String> cardArray = ['Today', 'Yesterday', 'This Month', 'Last Month'];

String getDateFromIndex(int index) {
  String date = '';
  if (index == 0 || index == 1) {
    date = getDate(-index);
  } else if (index == 2) {
    date = getMonth();
  } else if (index == 3) {
    date = lastMonth();
  }
  return date;
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
