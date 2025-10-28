import 'package:kobi_pay_interview/imports.dart';

class CustomPieGraph extends StatefulWidget {
  final double centerSpaceRadius;
  final List<PieChartSectionData> sectionList;
  final Function(int) index;
  final double smallRadius;
  final String title;

  const CustomPieGraph({
    super.key,
    required this.smallRadius,
    required this.sectionList,
    required this.index,
    this.centerSpaceRadius = 0.0,
    this.title = '',
  });

  @override
  State<CustomPieGraph> createState() => _CustomPieGraphState();
}

class _CustomPieGraphState extends State<CustomPieGraph> {
  int touchedIndex = -1;
  double radius = 0;
  bool isTouched = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    radius = size.width * .7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        SizedBox(height: 12),
        AspectRatio(
          aspectRatio: 1.23,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      widget.index(touchedIndex);
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                    widget.index(touchedIndex);
                  });
                },
              ),
              centerSpaceRadius: widget.centerSpaceRadius,
              startDegreeOffset: 180,
              borderData: FlBorderData(show: false),
              sectionsSpace: 1,
              sections: widget.sectionList,
            ),
          ),
        ),
      ],
    );
  }
}
