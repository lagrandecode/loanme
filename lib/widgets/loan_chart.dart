import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/loan_data.dart';

class LoanChart extends StatelessWidget {
  final List<MonthlyData> monthlyData;
  final Color loanColor;
  final Color savingsColor;

  const LoanChart({
    super.key,
    required this.monthlyData,
    this.loanColor = Colors.red,
    this.savingsColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1000,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.1),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < monthlyData.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      monthlyData[value.toInt()].monthName,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1000,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    '\$${value.toInt()}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                );
              },
              reservedSize: 40,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: monthlyData.length.toDouble() - 1,
        minY: 0,
        maxY: _getMaxY(),
        lineBarsData: [
          LineChartBarData(
            spots: monthlyData.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.loanPayment);
            }).toList(),
            isCurved: true,
            color: loanColor,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: loanColor,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: loanColor.withOpacity(0.1),
            ),
          ),
          LineChartBarData(
            spots: monthlyData.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.savings);
            }).toList(),
            isCurved: true,
            color: savingsColor,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: savingsColor,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: savingsColor.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  double _getMaxY() {
    double maxLoan = 0;
    double maxSavings = 0;

    for (var data in monthlyData) {
      if (data.loanPayment > maxLoan) maxLoan = data.loanPayment;
      if (data.savings > maxSavings) maxSavings = data.savings;
    }

    return (maxLoan > maxSavings ? maxLoan : maxSavings) * 1.2;
  }
} 