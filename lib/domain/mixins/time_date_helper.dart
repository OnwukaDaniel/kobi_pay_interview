import 'package:kobi_pay_interview/imports.dart';

mixin TimeDateHelper {
  String dateFromDateTimeString(String input) {
    try {
      return DateFormat('dd/MM/yyyy').format(DateTime.parse(input));
    } catch (e) {
      return input;
    }
  }

  String humanReadableDateTime(String input) {
    try {
      final dt = DateTime.parse(input).toLocal();
      final now = DateTime.now();
      final dateOnly = DateTime(dt.year, dt.month, dt.day);
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(Duration(days: 1));
      final timePart = DateFormat('hh:mm a').format(dt).toLowerCase();

      if (dateOnly == today) return 'Today $timePart';
      if (dateOnly == yesterday) return 'Yesterday $timePart';

      final datePart = DateFormat('d MMM yy').format(dt);
      return '$datePart $timePart';
    } catch (e) {
      return input;
    }
  }
}
