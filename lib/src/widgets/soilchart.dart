import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:soilmaster/constants/colors.dart';

class BarChartSample6 extends StatelessWidget {
  const BarChartSample6({super.key});

  final pilateColor = Colors.purple;
  final cyclingColor = Colors.cyan;
  final quickWorkoutColor = Colors.blue;
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: quickWorkoutColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: cyclingColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget lefttiles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    int text;
    switch (value.toInt()) {
      case 0:
        text = 0;
        break;
      case 2:
        text = 2;
        break;
      case 4:
        text = 4;
        break;
      case 6:
        text = 6;
        break;
      case 8:
        text = 8;
        break;
      case 10:
        text = 10;
        break;
      case 12:
        text = 12;
        break;

      default:
        text = 14;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text.toString(), style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Soil Activity',
            style: TextStyle(
              color: kBlueColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          LegendsListWidget(
            legends: [
              Legend('Soil Moisture', pilateColor),
              Legend('Temperature', quickWorkoutColor),
              Legend('Humidity', cyclingColor),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 1.5,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          getTitlesWidget: lefttiles,
                          showTitles: true,
                          interval: 2)),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 20,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 2, 3, 2),
                  generateGroupData(1, 2, 5, 1.7),
                  generateGroupData(2, 1.3, 3.1, 2.8),
                  generateGroupData(3, 3.1, 4, 3.1),
                  generateGroupData(4, 0.8, 3.3, 3.4),
                  generateGroupData(5, 2, 5.6, 1.8),
                  generateGroupData(6, 1.3, 3.2, 2),
                  generateGroupData(7, 2.3, 3.2, 3),
                  generateGroupData(8, 2, 4.8, 2.5),
                  generateGroupData(9, 1.2, 3.2, 2.5),
                  generateGroupData(10, 1, 4.8, 3),
                  generateGroupData(11, 2, 4.4, 2.8),
                ],
                maxY: 11 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 3.3,
                      color: pilateColor,
                      strokeWidth: 0.5,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 8,
                      color: quickWorkoutColor,
                      strokeWidth: 0.5,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 11,
                      color: cyclingColor,
                      strokeWidth: 0.5,
                      dashArray: [20, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          name,
          style: const TextStyle(
            color: Color(0xff757391),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class LegendsListWidget extends StatelessWidget {
  const LegendsListWidget({
    super.key,
    required this.legends,
  });
  final List<Legend> legends;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: legends
          .map(
            (e) => LegendWidget(
              name: e.name,
              color: e.color,
            ),
          )
          .toList(),
    );
  }
}

class Legend {
  Legend(this.name, this.color);
  final String name;
  final Color color;
}
