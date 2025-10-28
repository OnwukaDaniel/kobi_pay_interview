import 'package:kobi_pay_interview/imports.dart';

class TransactionHistoryRepo {
  static final Dio _dio = Dio();

  static Future<NetworkState<List<Transaction>>> fetchTransactions() async {
    try {
      final response = await _dio.get(Strings.transactionHistoryUrl);
      if (response.statusCode! <= 300) {
        final List data = response.data;
        final transactions = data.map((e) => Transaction.fromJson(e)).toList();
        return NetworkSuccess(transactions);
      } else {
        debugPrint('Failed with status: ${response.statusCode}');
        return NetworkFailure('Failed to fetch transactions. Retry later.');
      }
    } catch (e) {
      debugPrint('Failed : ${e.toString()}');
      return NetworkFailure(e.toString());
    }
  }

  static Future<NetworkState<List<WalletTransaction>>>
  fetchWalletTransactions() async {
    try {
      final response = await _dio.get(Strings.wallet);
      if (response.statusCode! <= 300) {
        final List data = response.data;
        final transactions =
            data.map((e) => WalletTransaction.fromJson(e)).toList();
        return NetworkSuccess(transactions);
      } else {
        debugPrint('Failed with status: ${response.statusCode}');
        return NetworkFailure(
          'Failed to fetch wallet transactions. Retry later.',
        );
      }
    } catch (e) {
      debugPrint('Failed : ${e.toString()}');
      return NetworkFailure(e.toString());
    }
  }
}
