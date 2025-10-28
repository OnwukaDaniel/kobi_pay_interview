import 'package:kobi_pay_interview/data/models/balance_card.dart';
import 'package:kobi_pay_interview/imports.dart';

class WalletTransactionViewmodel
    extends StateNotifier<NetworkState<BalanceCard>> {
  List<WalletTransaction> allBalance = [];
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  List<Color> monthColors = [
    Colors.red, // Jan
    Colors.pink, // Feb
    Colors.purple, // Mar
    Colors.deepPurple, // Apr
    Colors.indigo, // May
    Colors.blue, // Jun
    Colors.lightBlue, // Jul
    Colors.cyan, // Aug
    Colors.teal, // Sep
    Colors.green, // Oct
    Colors.lightGreen, // Nov
    Colors.lime, // Dec
  ];

  WalletTransactionViewmodel() : super(NetworkLoading()) {
    fetchWalletTransactions();
  }

  void setLoading() {
    state = NetworkLoading();
  }

  Future<void> fetchWalletTransactions() async {
    setLoading();
    final result = await TransactionHistoryRepo.fetchWalletTransactions();
    if (result is NetworkSuccess) allBalance = (result as NetworkSuccess).data;
    final data = getMonthlyBalance(DateFormat('MMM').format(DateTime.now()));
    state = switch (result) {
      NetworkSuccess() => NetworkSuccess(data),
      NetworkFailure() => NetworkFailure((result as NetworkFailure).message),
      NetworkLoading() => NetworkLoading(),
    };
  }

  BalanceCard getMonthlyBalance(String month, {bool notifySuccess = true}) {
    if (allBalance.isEmpty) {
      return BalanceCard(total: 0.0, month: month, items: []);
    }
    final chartList = getMonths();
    final monthBal =
        allBalance.where((e) {
          return DateFormat('MMM').format(DateTime.parse(e.time)) == month;
        }).toList();
    final total = monthBal.fold(
      0.0,
      (a, b) => a + (double.tryParse(b.amount) ?? 0),
    );
    final card = BalanceCard(total: total, month: month, items: chartList);
    if (notifySuccess) state = NetworkSuccess(card);
    return card;
  }

  List<PieChartSectionData> getMonths() {
    final results = <PieChartSectionData>[];
    for (final m in month) {
      final monthItems =
          allBalance
              .where(
                (t) => DateFormat('MMM').format(DateTime.parse(t.time)) == m,
              )
              .toList();
      final total = monthItems.fold<double>(
        0.0,
        (sum, t) => sum + (double.tryParse(t.amount) ?? 0.0),
      );
      results.add(
        PieChartSectionData(
          value: total,
          title: m,
          color: monthColors[month.indexOf(m) % monthColors.length],
          radius: 40,
          showTitle: false,
          titleStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return results;
  }
}

final walletTransactionViewmodelProvider = StateNotifierProvider<
  WalletTransactionViewmodel,
  NetworkState<BalanceCard>
>((ref) => WalletTransactionViewmodel());
