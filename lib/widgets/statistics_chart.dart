import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const months = ["Oct", "Nov", "Dec", "Jan", "Feb", "Mar"];
                  return Text(months[value.toInt()], style: TextStyle(fontSize: 12));
                },
                reservedSize: 35,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 2),
                FlSpot(2, 4),
                FlSpot(3, 6),
                FlSpot(4, 5),
                FlSpot(5, 7),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
