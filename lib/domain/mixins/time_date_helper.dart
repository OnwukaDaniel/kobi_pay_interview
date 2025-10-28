import 'package:kobi_pay_interview/imports.dart';

mixin TimeDateHelper {
  String dateFromDateTimeString(String input) {
    try {
      return DateFormat('dd/MM/yyyy').format(DateTime.parse(input));
    } catch (e) {
      return input;
    }
  }
}
