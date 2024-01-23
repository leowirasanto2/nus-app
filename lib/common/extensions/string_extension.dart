import 'package:intl/intl.dart';

extension StringExtension on String? {
  bool get isEmptyOrNull => this == null || (this ?? '').isEmpty;

  String get orEmpty => this ?? '';

  String? formattedDate({String expectedFormat = "MMM dd, yy"}) {
    String stringDate = orEmpty;
    DateTime dateTime = DateTime.parse(stringDate);
    DateFormat format = DateFormat(expectedFormat);
    String formatted = format.format(dateTime);
    return formatted;
  }
}
