import 'package:kobi_pay_interview/imports.dart';

class BalanceCard {
  final double total;
  final String month;
  final List<PieChartSectionData> items;

  const BalanceCard({
    required this.total,
    required this.month,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {'total': total, 'month': month, 'items': items};
  }
}
