import 'package:kobi_pay_interview/imports.dart';

class TransactionSummary extends HookConsumerWidget {
  const TransactionSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transactionViewmodelProvider);

    return Scaffold(
      backgroundColor: AppColor.surface,
      appBar: AppBar(
        backgroundColor: AppColor.surface,
        leading: AppBackArrow(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          24.w,
        ],
        title: Text(
          Strings.history,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          24.h,
          Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Image.asset(Images.netflixLogo, height: 30, width: 30),
          ),
          8.h,
          Text(
            Strings.netflix,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          6.h,
          Text(
            Strings.prodCompany,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          36.h,
          BalanceView(),
          24.h,
          Text(
            Strings.transaction,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          16.h,
          TransactionHistoryList(),
        ],
      ),
    );
  }
}
