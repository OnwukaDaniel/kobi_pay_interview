mixin JsonHelpers {
  static int integer(dynamic input) =>
      int.tryParse(input?.toString() ?? '') ?? 0;

  static String string(dynamic input) =>
      input?.toString() ?? '';

  static bool boolean(dynamic input) {
    if (input is bool) return input;
    if (input is String) return input.toLowerCase() == 'true';
    if (input is num) return input != 0;
    return false;
  }

  static DateTime dateTime(dynamic input) {
    try {
      return DateTime.parse(input?.toString() ?? '');
    } catch (e) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }

  static List<String> stringList(dynamic input) {
    if (input is List) {
      return input.map((e) => string(e)).toList();
    }
    return [];
  }

  static double decimal(dynamic input) =>
      double.tryParse(input?.toString() ?? '') ?? 0.0;

  static List<int> integerList(dynamic input) {
    if (input is List) {
      return input.map((e) => integer(e)).toList();
    }
    return [];
  }
}