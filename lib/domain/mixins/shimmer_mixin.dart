import 'package:kobi_pay_interview/imports.dart';

mixin ShimmerMixin {
  Widget shimmerCard({double height = 50}) {
    return Builder(
      builder: (context) {
        var size = MediaQuery.of(context).size;
        return Shimmer.fromColors(
          baseColor: Colors.grey.withAlpha(20),
          highlightColor: Colors.grey.withAlpha(40),
          child: Container(
            width: size.width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }

  Widget shimmer({double height = 50, double width = 50}) {
    return Builder(
      builder: (context) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withAlpha(20),
          highlightColor: Colors.grey.withAlpha(40),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }

  Widget rowBoxesShimmer({
    double height = 30,
    double width = 30,
    int count = 15,
  }) {
    return SizedBox(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(count, (e) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withAlpha(20),
              highlightColor: Colors.grey.withAlpha(40),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget shimmerTable({
    required int columns,
    required int rows,
    double height = 50,
  }) {
    return Builder(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withAlpha(30)),
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: List.generate(
                  columns,
                  (index) => DataColumn(
                    label: Shimmer.fromColors(
                      baseColor: Colors.grey.withAlpha(20),
                      highlightColor: Colors.grey.withAlpha(40),
                      child: Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                rows: List.generate(
                  rows,
                  (rowIndex) => DataRow(
                    cells: List.generate(
                      columns,
                      (colIndex) => DataCell(
                        Shimmer.fromColors(
                          baseColor: Colors.grey.withAlpha(20),
                          highlightColor: Colors.grey.withAlpha(40),
                          child: Container(
                            width: colIndex == 0 ? 120 : 80, // First column wider
                            height: height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
