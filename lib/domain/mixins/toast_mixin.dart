import 'package:kobi_pay_interview/imports.dart';

mixin ToastMixin {
  void showToast(String message, {AlignmentGeometry? alignment}) {
    toastification.show(
      backgroundColor: Colors.black87,
      borderRadius: BorderRadius.circular(8),
      alignment: alignment ?? Alignment.topCenter,
      title: Text(message, style: TextStyle(color: Colors.white)),
      autoCloseDuration: const Duration(seconds: 5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(50),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  void showSuccessToast(String message, {AlignmentGeometry? alignment}) {
    toastification.show(
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(8),
      alignment: alignment ?? Alignment.topCenter,
      title: Text(message, style: TextStyle(color: Colors.white)),
      autoCloseDuration: const Duration(seconds: 5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(50),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  void showErrorToast(String message, {AlignmentGeometry? alignment}) {
    toastification.show(
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(8),
      title: Text(message, style: TextStyle(color: Colors.white)),
      icon: const Icon(Icons.error, color: Colors.white),
      alignment: alignment ?? Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(50),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
