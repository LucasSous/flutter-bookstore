import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final int inProgress;
  final int late;
  final int onTime;
  final int pending;
  const Chart(
      {super.key,
      required this.inProgress,
      required this.late,
      required this.onTime,
      required this.pending});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int touchedIndex = -1;
  String shartLabel = '';
  String quantity = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.3,
          child: Row(
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 2,
                      centerSpaceRadius: 80,
                      sections: showingSections(),
                    ),
                    swapAnimationDuration:
                        const Duration(milliseconds: 250), // Optional
                    swapAnimationCurve: Curves.ease,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              children: [
                Container(
                    height: 15, width: 15, color: const Color(0xFF0FCCF2)),
                const SizedBox(
                  width: 10,
                ),
                Text('Em andamento - ${widget.inProgress}'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 15, width: 15, color: const Color(0xFF54D572)),
                const SizedBox(
                  width: 10,
                ),
                Text('No prazo - ${widget.onTime}'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 15, width: 15, color: const Color(0xFFFF7E7E)),
                const SizedBox(
                  width: 10,
                ),
                Text('Em atraso - ${widget.late}'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 15, width: 15, color: const Color(0xFFFFE941)),
                const SizedBox(
                  width: 10,
                ),
                Text('Pendentes - ${widget.pending}'),
              ],
            )
          ]),
        )
      ],
    );
  }

  returnPercentage(value) {
    int sum = widget.inProgress + widget.late + widget.onTime + widget.pending;
    double percentage = (value * 100) / sum;
    return percentage.toStringAsFixed(0);
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      double fontSize = 16.0;
      double radius = 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xFF0FCCF2),
            value: widget.inProgress.toDouble(),
            title: '${returnPercentage(widget.inProgress).toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFF54D572),
            value: widget.onTime.toDouble(),
            title: '${returnPercentage(widget.onTime).toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xFFFFE941),
            value: widget.pending.toDouble(),
            title: '${returnPercentage(widget.pending).toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xFFFF7E7E),
            value: widget.late.toDouble(),
            title: '${returnPercentage(widget.late).toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
