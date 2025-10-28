import 'package:kobi_pay_interview/imports.dart';

class TransactionViewmodel
    extends StateNotifier<NetworkState<List<Transaction>>> {
  TransactionViewmodel() : super(NetworkLoading()) {
    fetchTransactions();
  }

  void setLoading() {
    state = NetworkLoading();
  }

  Future<void> fetchTransactions() async {
    setLoading();
    final result = await TransactionHistoryRepo.fetchTransactions();
    state = result;
  }
}

final transactionViewmodelProvider = StateNotifierProvider<
  TransactionViewmodel,
  NetworkState<List<Transaction>>
>((ref) => TransactionViewmodel());
