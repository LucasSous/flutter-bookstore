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
  int touchedIndex = 0;
  String shartLabel = '';
  String quantity = '';

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      AspectRatio(
        aspectRatio: 1.1,
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
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          Text(
            shartLabel,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 79, 79, 79)),
          ),
          Text(
            quantity,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ],
      )
    ]);
  }

  shartData(int index) {
    if (index < 0) return;
    switch (index) {
      case 0:
        setState(() {
          shartLabel = 'Em Andamento';
          quantity = widget.inProgress.toString();
        });

        break;
      case 1:
        setState(() {
          shartLabel = 'No Prazo';
          quantity = widget.onTime.toString();
        });
        break;
      case 2:
        setState(() {
          shartLabel = 'Pendentes';
          quantity = widget.pending.toString();
        });
        break;
      case 3:
        setState(() {
          shartLabel = 'Em Atraso';
          quantity = widget.late.toString();
        });
        break;
    }
  }

  returnPercentage(value) {
    int sum = widget.inProgress + widget.late + widget.onTime + widget.pending;
    double percentage = (value * 100) / sum;
    return percentage.toStringAsPrecision(2);
  }

  List<PieChartSectionData> showingSections() {
    shartData(touchedIndex);
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Theme.of(context).primaryColor,
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
            color: const Color.fromARGB(177, 38, 214, 44),
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
            color: const Color.fromARGB(255, 255, 126, 13),
            value: widget.pending.toDouble(),
            title: '${returnPercentage(widget.pending).toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color.fromARGB(176, 255, 57, 57),
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
