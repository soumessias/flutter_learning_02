import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class Chart extends StatefulWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Text(
        'Total de Despesas:',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        widget.recentTransactions.isEmpty
            ? '0'
            : '${widget.recentTransactions.map((e) => e.value).reduce((value, element) => value + element)}',
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.teal),
      ),
      SizedBox(
        height: 10,
      ),
      // AspectRatio(
      //   aspectRatio: 10,
      //   child: LineChart(
      //     LineChartData(
      //         // read about it in the LineChartData section
      //         ),
      //     swapAnimationDuration: Duration(milliseconds: 150), // Optional
      //     swapAnimationCurve: Curves.linear, // Optional
      //   ),
      // ),
    ]);
  }
}
