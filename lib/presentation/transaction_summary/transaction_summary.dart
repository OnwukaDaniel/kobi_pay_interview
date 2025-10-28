import 'package:kobi_pay_interview/imports.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
          actionButton(state, ref),
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

  Widget actionButton(NetworkState<List<Transaction>> state, WidgetRef ref) {
    if (state is NetworkSuccess) {
      return PopupMenuButton<String>(
        icon: Icon(Icons.more_vert),
        onSelected: (value) {
          if (value == 'export_pdf') {
            exportTransactionsAsPdf(ref);
          }
        },
        itemBuilder:
            (context) =>
        [
          PopupMenuItem(
            value: 'export_pdf',
            child: Text('Export as PDF'),
          ),
        ],
      );
    }
    if (state is NetworkLoading) {
      return SizedBox(width: 20, height: 20, child: CircularProgressIndicator());
    }
    return SizedBox.shrink();
  }

  Future<void> exportTransactionsAsPdf(WidgetRef ref) async {
    final pdf = pw.Document();
    final state = ref.watch(transactionViewmodelProvider);
    final transactions = (state as NetworkSuccess<List<Transaction>>).data;
    pdf.addPage(
      pw.Page(
        build:
            (context) =>
            pw.Table.fromTextArray(
              headers: [
                'Date',
                'Title',
                'Amount',
                'Merchant',
                'Method',
                'Status',
              ],
              data:
              transactions
                  .map(
                    (t) =>
                [
                  t.createdAt,
                  t.title,
                  t.amount,
                  t.merchantName,
                  t.method,
                  t.status ? 'Success' : 'Failed',
                ],
              )
                  .toList(),
            ),
      ),
    );

    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'transactions.pdf',
    );
  }
}
