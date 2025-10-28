class Transaction {
  final String createdAt;
  final String title;
  final String icon;
  final String amount;
  final String merchantName;
  final String method;
  final bool status;
  final String trxRef;
  final String description;
  final String image;
  final String id;

  Transaction({
    required this.createdAt,
    required this.title,
    required this.icon,
    required this.amount,
    required this.merchantName,
    required this.method,
    required this.status,
    required this.trxRef,
    required this.description,
    required this.image,
    required this.id,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      createdAt: json['createdAt'],
      title: json['title'],
      icon: json['icon'],
      amount: json['amount'],
      merchantName: json['merchant_name'],
      method: json['method'],
      status: json['status'],
      trxRef: json['trx_ref'],
      description: json['description'],
      image: json['image'],
      id: json['id'],
    );
  }
}