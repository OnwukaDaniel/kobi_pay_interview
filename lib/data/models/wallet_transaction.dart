class WalletTransaction {
    final String time;
    final String amount;
    final String id;

    WalletTransaction({
      required this.time,
      required this.amount,
      required this.id,
    });

    factory WalletTransaction.fromJson(Map<String, dynamic> json) {
      return WalletTransaction(
        time: json['time'],
        amount: json['amount'],
        id: json['id'],
      );
    }
  }