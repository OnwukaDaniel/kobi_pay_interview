import 'package:kobi_pay_interview/imports.dart';

mixin NumberFormatterMixin {
  /// Formats a [number] with commas. You can specify [decimalPlaces].
  String formatWithCommas(num number, {int decimalPlaces = 0}) {
    final pattern = decimalPlaces > 0 ? '#,##0.${'0' * decimalPlaces}' : '#,###';
    return NumberFormat(pattern).format(number);
  }

  /// Returns an input formatter that adds commas as thousand separators
  TextInputFormatter numberInputFormatter({int decimalPlaces = 0}) {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(',', '');

      if (text.isEmpty || text == '-') {
        return newValue;
      }

      // Parse the value
      final num? value = num.tryParse(text);

      if (value == null) {
        return oldValue;
      }

      // Format with commas
      final pattern = decimalPlaces > 0 ? '#,##0.${'0' * decimalPlaces}' : '#,###';
      final formattedText = NumberFormat(pattern).format(value);

      // Maintain the cursor position
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }
}
