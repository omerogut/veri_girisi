import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySpend;

  const MyBarGraph({
    super.key,
    required this.weeklySpend,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      monAmount: weeklySpend[0],
      tueAmount: weeklySpend[1],
      wedAmount: weeklySpend[2],
      thuAmount: weeklySpend[3],
      friAmount: weeklySpend[4],
      satAmount: weeklySpend[5],
      sunAmount: weeklySpend[6],
      benAmount: weeklySpend[7],
    );
    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(
              showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        barGroups: myBarData.barData
            .map(
              (data) =>
              BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.indigoAccent,
                    width: 25,
                    borderRadius: BorderRadius.circular(5),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.indigoAccent[100],
                    ),
                  ),
                ],
              ),
        )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('0-32', style: style,);
      break;
    case 1:
      text = const Text('33-64', style: style,);
      break;
    case 2:
      text = const Text('65-96', style: style,);
      break;
    case 3:
      text = const Text('97-128', style: style,);
      break;
    case 4:
      text = const Text('129-160', style: style,);
      break;
    case 5:
      text = const Text('161-192', style: style,);
      break;
    case 6:
      text = const Text('193-224', style: style,);
      break;
    default:
      text = const Text('225-256', style: style,);
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
