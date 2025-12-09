// import 'package:job_sphere/env.dart';

// String getIconFullUrl(String path) => "$serverUrl$path";
// String getImageFullUrl(String path) => "$serverUrl/uploads/$path";

// String formatDateWithFullMonthName(DateTime date) {
//   final String month = fullMonthNames[date.month - 1];
//   final String dayWithOrdinal = toOrdinal(date.day);
//   final String year = date.year.toString();

//   return '$month $dayWithOrdinal, $year';
// }

// String formatDateWithSortMonthName(DateTime date) {
//   final String month = shortMonthNames[date.month - 1];
//   final String dayWithOrdinal = toOrdinal(date.day);
//   final String year = date.year.toString();

//   return '$month $dayWithOrdinal, $year';
// }

///
///
///
///

// final List<String> _dayNames = ['MO', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

String toOrdinal(int number) {
  if (number < 1 || number > 30) {
    throw ArgumentError('Number must be between 1 and 30');
  }

  if (number % 100 >= 11 && number % 100 <= 13) {
    return '${number}th';
  }

  switch (number % 10) {
    case 1:
      return '${number}st';
    case 2:
      return '${number}nd';
    case 3:
      return '${number}rd';
    default:
      return '${number}th';
  }
}

final List<String> shortMonthNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

final List<String> fullMonthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
