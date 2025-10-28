import 'package:kobi_pay_interview/imports.dart';

class AppBackArrow extends StatelessWidget {
  final Function? onPressed;

  const AppBackArrow({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Theme.of(context).platform == TargetPlatform.iOS
            ? Icons.arrow_back_ios
            : Icons.arrow_back,
      ),
      onPressed:
          onPressed != null
              ? () => onPressed!()
              : Navigator.canPop(context)
              ? () => Navigator.pop(context)
              : null,
    );
  }
}
