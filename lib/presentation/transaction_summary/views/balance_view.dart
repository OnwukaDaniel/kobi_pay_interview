import 'package:kobi_pay_interview/imports.dart';

class BalanceView extends StatefulHookConsumerWidget {
  const BalanceView({super.key});

  @override
  ConsumerState<BalanceView> createState() => _BalanceViewState();
}

class _BalanceViewState extends ConsumerState<BalanceView> with ShimmerMixin {
  var touchIndex = -1;
  TextStyle balanceTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(walletTransactionViewmodelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.totalPayment, style: TextStyle(fontSize: 14)),
                  2.h,
                  amountWidget(),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () => monthOnTap(context),
              child: Container(
                padding: const EdgeInsets.all(9),
                margin: EdgeInsets.all(4),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
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
            ),
          ],
        ),
        32.h,
        switch (state) {
          NetworkLoading() => Center(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: shimmer(width: 300, height: 150),
            ),
          ),
          NetworkFailure() => Text(
            state.message,
            style: balanceTextStyle.copyWith(color: Colors.red),
          ),
          NetworkSuccess() => Builder(
            builder: (context) {
              var items = state.data.items;
              items =
                  items.map((e) {
                    if (touchIndex == items.indexOf(e)) {
                      return e.copyWith(radius: 49, showTitle: true);
                    }
                    return e.copyWith(radius: 40);
                  }).toList();
              return Stack(
                alignment: Alignment.center,
                children: [
                  CustomPieGraph(
                    smallRadius: 50,
                    centerSpaceRadius: size.width * .15,
                    sectionList: items,
                    index: (e) => setState(() => touchIndex = e),
                  ),
                  Column(
                    children: [
                      amountWidget(fontSize: 16),
                      1.h,
                      Text(
                        Strings.netflixExpress,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        },
        32.h,
      ],
    );
  }

  Widget amountWidget({double? fontSize}) {
    final state = ref.watch(walletTransactionViewmodelProvider);
    switch (state) {
      case NetworkSuccess<BalanceCard>():
        return Row(
          mainAxisAlignment:
              fontSize == null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.data.total.toStringAsFixed(2),
              style: balanceTextStyle.copyWith(
                fontFamily: Strings.specialGothic,
                fontWeight: FontWeight.w200,
                fontSize: fontSize,
              ),
            ),
            4.w,
            Padding(
              padding: EdgeInsets.only(top: fontSize == null? 1: 0),
              child: Text(
                '\$',
                style: TextStyle(
                  fontSize: ((fontSize ?? 18) - 1),
                  fontFamily: Strings.specialGothic,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      case NetworkLoading<BalanceCard>():
        return shimmer(width: 100, height: 28);
      case NetworkFailure<BalanceCard>():
        return Text(
          state.message,
          style: balanceTextStyle.copyWith(color: Colors.red),
        );
    }
  }

  monthOnTap(BuildContext context) async {
    final notifier = ref.read(walletTransactionViewmodelProvider.notifier);
    final selectedMonth = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Month'),
        children: notifier.month.map((month) => SimpleDialogOption(
          onPressed: () => Navigator.pop(context, month),
          child: Text(month),
        )).toList(),
      ),
    );
    if (selectedMonth != null) notifier.getMonthlyBalance(selectedMonth);
  }
}
