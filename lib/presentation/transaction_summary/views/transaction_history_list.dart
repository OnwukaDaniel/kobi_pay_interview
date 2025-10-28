import 'package:kobi_pay_interview/imports.dart';

class TransactionHistoryList extends HookConsumerWidget
    with ShimmerMixin, TimeDateHelper {
  const TransactionHistoryList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(transactionViewmodelProvider);

    switch (state) {
      case NetworkLoading():
        return shimmerBuildCard();
      case NetworkFailure(:final message):
        return Text('Error: $message');
      case NetworkSuccess<List<Transaction>>(:final data):
        final transactions = data;
        return ListView.separated(
          itemCount: transactions.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final trx = transactions[index];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(15),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Wrap(
                        children: [
                          SizedBox(
                            width: 55,
                            height: 55,
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(360),
                              child: Image.network(
                                trx.icon,
                                width: 55,
                                height: 55,
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.w,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trx.title,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              humanReadableDateTime(trx.createdAt),
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      16.w,
                      Text(
                        '-${trx.amount}',
                        style: TextStyle(
                          color: AppColor.accent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => 12.h,
        );
    }
  }

  Widget shimmerBuildCard() {
    return Column(
      children: List.generate(
        5,
        (e) => Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                shimmer(height: 40, width: 40),
                16.w,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmer(height: 16, width: double.infinity),
                      8.h,
                      shimmer(height: 14, width: 150),
                    ],
                  ),
                ),
                16.w,
                shimmer(height: 16, width: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
