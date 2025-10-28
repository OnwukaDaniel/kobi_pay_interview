import 'package:kobi_pay_interview/imports.dart';

class BalanceView extends HookConsumerWidget with ShimmerMixin {
  const BalanceView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(walletTransactionViewmodelProvider);
    TextStyle balanceTextStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.totalPayment, style: TextStyle(fontSize: 14)),
              2.h,
              switch (state) {
                NetworkLoading() => shimmer(width: 100, height: 28),
                NetworkFailure() => Text(
                  state.message,
                  style: balanceTextStyle.copyWith(color: Colors.red),
                ),
                NetworkSuccess() => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.data.total.toStringAsFixed(2),
                      style: balanceTextStyle.copyWith(
                        fontFamily: Strings.specialGothic,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    12.w,
                    Text(
                      '\$',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              },
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(9),
          margin: EdgeInsets.all(4),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColor.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              switch (state) {
                NetworkLoading() => shimmer(width: 60, height: 10),
                NetworkFailure() => Text(
                  DateFormat('MMM').format(DateTime.now()),
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                NetworkSuccess() => Text(
                  state.data.month,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              },
              4.w,
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ],
    );
  }
}
