import 'package:kobi_pay_interview/imports.dart';

class TransactionDetailsPage extends StatefulWidget {
  final Transaction transaction;

  const TransactionDetailsPage({super.key, required this.transaction});

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  bool isRefunded = false;

  @override
  void initState() {
    super.initState();
    _checkRefunded();
  }

  Future<void> _checkRefunded() async {
    final prefs = await SharedPreferences.getInstance();
    final refundedIds = prefs.getStringList('refunded_transactions') ?? [];
    setState(() {
      isRefunded = refundedIds.contains(widget.transaction.id);
    });
  }

  Future<void> _refundTransaction() async {
    final prefs = await SharedPreferences.getInstance();
    final refundedIds = prefs.getStringList('refunded_transactions') ?? [];
    refundedIds.add(widget.transaction.id);
    await prefs.setStringList('refunded_transactions', refundedIds);
    setState(() {
      isRefunded = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Transaction refunded successfully!')),
    );
  }

  Widget _propertyRow(String property, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              property,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w900, color: valueColor),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trx = widget.transaction;
    return Scaffold(
      appBar: AppBar(
        leading: AppBackArrow(),
        title: Text(
          Strings.transactionDetails,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(trx.icon),
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(height: 24),
                _propertyRow('Merchant', trx.merchantName),
                Divider(),
                _propertyRow('Amount', '\$${trx.amount}', valueColor: Colors.green),
                Divider(),
                _propertyRow('Payment Method', trx.method.capitalize),
                Divider(),
                _propertyRow(
                  'Status',
                  isRefunded ? 'Refunded' : (trx.status ? 'Success' : 'Failed'),
                  valueColor: isRefunded
                      ? Colors.orange
                      : (trx.status ? Colors.green : Colors.red),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.undo),
                    label: Text(isRefunded ? 'Refunded' : 'Refund'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isRefunded ? Colors.grey : Colors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: isRefunded ? null : _refundTransaction,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
