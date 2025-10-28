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

  BalanceCard getMonthlyBalance(String month, {bool notifySuccess = false}) {
    if (allBalance.isEmpty) {
      return BalanceCard(total: 0.0, month: month, items: []);
    }
    final monthBal =
        allBalance.where((e) {
          return DateFormat('MMM').format(DateTime.parse(e.time)) == month;
        }).toList();
    final total = monthBal.fold(
      0.0,
      (a, b) => a + (double.tryParse(b.amount) ?? 0),
    );
    if (notifySuccess) {
      state = NetworkSuccess(
        BalanceCard(total: total, month: month, items: monthBal),
      );
    }
    return BalanceCard(total: total, month: month, items: monthBal);
  }
}

final walletTransactionViewmodelProvider = StateNotifierProvider<
  WalletTransactionViewmodel,
  NetworkState<BalanceCard>
>((ref) => WalletTransactionViewmodel());
