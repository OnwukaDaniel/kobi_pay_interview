class BalanceCard {
   final double total;
   final String month;
   final List<dynamic> items;

   const BalanceCard({
     required this.total,
     required this.month,
     required this.items,
   });

   BalanceCard copyWith({
     double? total,
     String? month,
     List<dynamic>? items,
   }) {
     return BalanceCard(
       total: total ?? this.total,
       month: month ?? this.month,
       items: items ?? this.items,
     );
   }

   factory BalanceCard.fromJson(Map<String, dynamic> json) {
     return BalanceCard(
       total: (json['total'] as num?)?.toDouble() ?? 0.0,
       month: json['month'] as String? ?? '',
       items: json['items'] as List<dynamic>? ?? const [],
     );
   }

   Map<String, dynamic> toJson() {
     return {
       'total': total,
       'month': month,
       'items': items,
     };
   }
 }