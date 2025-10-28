import 'package:kobi_pay_interview/imports.dart';

class TransactionSummary extends StatelessWidget {
  const TransactionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.surface,
      appBar: AppBar(
        backgroundColor: AppColor.surface,
        leading: AppBackArrow(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        title: Text(
          Strings.history,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
    );
  }
}
